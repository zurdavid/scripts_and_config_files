#Enable colors
autoload -U colors && colors

autoload -Uz vcs_info
precmd () { vcs_info } # always load before displaying prompt
zstyle ':vcs_info:*' formats ' :%F{red} %b%f'

setopt prompt_subst
NEWLINE=$'\n'
PROMPT='${NEWLINE}%n@%m %F{6}%~%f $vcs_info_msg_0_ ${NEWLINE}%B%F{12} ~>%f%b '

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

