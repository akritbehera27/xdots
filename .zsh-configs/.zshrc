# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#History
HISTSIZE=5000
SAVEHIST=5000
export HISTFILE=$HOME"/.cache/zhistory"
setopt hist_ignore_dups     # do not record an event that was just recorded again
setopt hist_ignore_all_dups # delete an old recorded event if a new event is a duplicate
setopt hist_ignore_space    # do not record an event starting with a space
setopt hist_save_no_dups    # do not write a duplicate event to the history file
setopt inc_append_history   # write to the history file immediately, not when the shell exits
setopt share_history        # share history between terminals


unsetopt beep
bindkey -e
autoload -U select-word-style
select-word-style bash

# tab autocompletions
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

#imporing key shoutcouts
source ~/.config/zsh/.zkeys

zstyle :compinstall filename "/home/$USER/.zshrc"

#Source
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugin/zsh-autosuggestions/zsh-autosuggestions.zsh 
source ~/.config/zsh/plugin/zsh-history-substring-search/zsh-history-substring-search.zsh

#importing aliases
source ~/.config/zsh/.zaliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

