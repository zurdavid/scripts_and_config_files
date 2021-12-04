#Enable colors
autoload -U colors && colors

export EDITOR=nvim

# git (version control systems)
autoload -Uz vcs_info
precmd () { vcs_info } # always load before displaying prompt
zstyle ':vcs_info:*' formats ' %F{4}:%f%F{red} %b%f'

function check_conda() {
  if [[ -v CONDA_DEFAULT_ENV ]]; then
    CONDAPROMPT="(%F{4}${PYTHON}%f ${CONDA_DEFAULT_ENV})"
  else
    unset CONDAPROMPT
  fi
}
precmd_functions+=(check_conda)

SEP1=$'\uE0C0'
LEGO=$'\uE0CF'
PYTHON=$'\uE235'
MINT=$'\uF30E'
NEWLINE=$'\n'

# PROMPT
setopt prompt_subst
#SIMPLE_PROMPT=true
if [[ -v SIMPLE_PROMPT ]];then
  PROMPT_NAME='%n@%m'
  PPROMPT='%B%F{12} ~>%f%b ' 
else
  PROMPT_NAME="%K{4} %n %k%K{12}%F{4}${SEP1}%f  $MINT  %k%F{12}${SEP1}%f "
  PPROMPT="%F{12} ${LEGO}%f  " 
fi
PROMPT='${NEWLINE}$PROMPT_NAME $CONDAPROMPT %F{6}%~%f $vcs_info_msg_0_ ${NEWLINE} ${PPROMPT}'

# Lines configured by zsh-newuser-install
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/david/.zshrc'

autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
# stack autocomplete
compinit
# End of lines added by compinstall
autoload -U +X bashcompinit && bashcompinit
# stack autocomplete
if command -v stack &> /dev/null; then
  eval "$(stack --bash-completion-script stack)"
fi

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


# USE CLIPBOARD in VI-MODE
function x11-clip-wrap-widgets() {
    # NB: Assume we are the first wrapper and that we only wrap native widgets
    # See zsh-autosuggestions.zsh for a more generic and more robust wrapper
    local copy_or_paste=$1
    shift

    for widget in $@; do
        # Ugh, zsh doesn't have closures
        if [[ $copy_or_paste == "copy" ]]; then
            eval "
            function _x11-clip-wrapped-$widget() {
                zle .$widget
                xclip -in -selection clipboard <<<\$CUTBUFFER
            }
            "
        else
            eval "
            function _x11-clip-wrapped-$widget() {
                CUTBUFFER=\$(xclip -out -selection clipboard)
                zle .$widget
            }
            "
        fi

        zle -N $widget _x11-clip-wrapped-$widget
    done
}
local copy_widgets=(
    vi-yank vi-yank-eol vi-delete vi-backward-kill-word vi-change-whole-line
)
local paste_widgets=(
    vi-put-{before,after}
)
# NB: can atm. only wrap native widgets
x11-clip-wrap-widgets copy $copy_widgets
x11-clip-wrap-widgets paste  $paste_widgets


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
__conda_setup="$('/home/david/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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
# ahj - remove the default Python environment artifact "(base)" from prompt
PS1=$(echo "$PS1" | perl -pe 's/^\(base\)\s*//' )

# ALIASES
alias activate='conda activate'
alias ds='conda activate ds'
alias xclip='xclip -selection clipboard'
alias gls='git status'
alias sz='source ~/.zshrc'  
alias gitgraph="git log --graph --decorate --all --oneline"

# gcc 10
export export PATH=/usr/local/gcc-10.2.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/gcc-10.2.0/lib64:$LD_LIBRARY_PATH

# source autojump
source /usr/share/autojump/autojump.zsh 2>/dev/null
