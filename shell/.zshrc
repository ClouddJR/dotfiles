# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git gh adb macos laravel)

source $ZSH/oh-my-zsh.sh

# Required for Homebrew when using machines with Apple Silicon
eval "$(/opt/homebrew/bin/brew shellenv)"

# Active z
. $HOME/.dotfiles/shell/z.sh

# Activate vi mode
bindkey -v

# Load the shell dotfiles
# ~/.dotfiles-custom can be used for other settings you don’t want to commit.
for file in ~/.dotfiles/shell/.{exports,aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

for file in ~/.dotfiles-custom/shell/.{exports,aliases,functions,zshrc}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

unset file

# Setup pyenv
eval "$(pyenv init -)"

# Activate fzf
[ -f $HOME/.dotfiles/shell/.fzf.zsh ] && source $HOME/.dotfiles/shell/.fzf.zsh
