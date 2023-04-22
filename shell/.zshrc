# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git gh adb macos laravel)

source $ZSH/oh-my-zsh.sh

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

# Open the VS Code with a 'code' command
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Setup pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Activate fzf
[ -f $HOME/.dotfiles/shell/.fzf.zsh ] && source $HOME/.dotfiles/shell/.fzf.zsh
