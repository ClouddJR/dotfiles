# Enable Powerlevel10k instant prompt. Should stay close to the top of $HOME/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to custom completions
fpath=($HOME/.dotfiles/shell/completions/ $fpath)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git gh adb macos laravel z zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Required for Homebrew when using machines with Apple Silicon
eval "$(/opt/homebrew/bin/brew shellenv)"

# Activate vi mode
bindkey -v

# Load the shell dotfiles
# $HOME/.dotfiles-custom can be used for other settings you don’t want to commit.
for file in $HOME/.dotfiles/shell/.{exports,aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

for file in $HOME/.dotfiles-custom/shell/.{exports,aliases,functions,zshrc}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

unset file

# Setup pyenv
eval "$(pyenv init -)"

# Activate fzf
[ -f $HOME/.dotfiles/shell/.fzf.zsh ] && source $HOME/.dotfiles/shell/.fzf.zsh

# To customize prompt, run `p10k configure` or edit $HOME/.p10k.zsh.
[[ ! -f $HOME/.p10k.zsh ]] || source $HOME/.p10k.zsh
