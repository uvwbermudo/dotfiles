#!/usr/bin/bash

dotfiles_repo="https://github.com/uvwbermudo/dotfiles.git"

green_check="✅"
red_cross="❌"

programs=(nvim fastfetch wezterm starship )
declare -A config_dirs=(
#	["oh-my-bash"]="$HOME/.oh-my-bash"
)

echo "----------------------------"
echo "      Dependency Check"
echo "----------------------------"

check_program() {
    if command -v "$1" > /dev/null 2>&1; then
        echo -e "$green_check $1 - OK!"
    else
        echo -e "$red_cross $1 - Not found!"
	check_passed=false
    fi
}

check_config_dir() {
	local config_name="$1"
	local config_path="$2"
	if [ -d "$config_path" ]; then
		echo -e "$green_check $1 - OK!"
	else
		echo -e "$red_cross $1 - Not found at $2"
	fi
}

echo -e "\n ⚙️ Checking programs...\n"
for program in "${programs[@]}"; do
    check_program "$program"
done

echo -e "\n 🛠️ Checking configurations...\n"
for key in "${!config_dirs[@]}"; do
	check_config_dir "$key" "${config_dirs[$key]}"
done

if $check_passed; then
    echo -e "\nYou're ready to use this dotfiles configuration 👌!"
    echo -e "Visit https://github.com/uvwbermudo/dotfiles for setup guide"
fi
