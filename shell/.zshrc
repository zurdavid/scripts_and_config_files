#Enable colors
autoload -U colors && colors

autoload -Uz vcs_info
precmd () { vcs_info } # always load before displaying prompt
zstyle ':vcs_info:*' formats ' %F{4}:%f%F{red} %b%f'

FLAME=$'\uE0C0'
LEGO=$'\uE0CF'

setopt prompt_subst
NEWLINE=$'\n'
PROMPT_NAME="%K{4} %n %k%K{12}%F{4}${FLAME}%f  %m %k%F{12}${FLAME}%f  "
#PROMPT_NAME='%n@%m'
PPROMPT="%F{12} ${LEGO}%f  " 
#PPROMPT='%B%F{12} ~>%f%b' 
PROMPT='${NEWLINE}$PROMPT_NAME %F{6}%~%f $vcs_info_msg_0_ ${NEWLINE} ${PPROMPT}'

# Lines configured by zsh-newuser-install
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/david/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# key bindings
bindkey -M viins 'jk' vi-cmd-mode

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
_fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/david/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/david/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/david/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/david/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#
alias activate='conda activate'
alias ds='conda activate ds'
alias xclip='xclip -selection clipboard'

# gcc 10
export export PATH=/usr/local/gcc-10.2.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/gcc-10.2.0/lib64:$LD_LIBRARY_PATH
