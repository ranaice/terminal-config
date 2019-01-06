#
# Zed Theme - https://github.com/ranaice/zed-terminal-theme
#
# # README
#
# In order for this theme to render correctly, you will need a
# [Nerd font](https://nerdfonts.com/#home).
##
### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts
# More info on how to customize - http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html

CURRENT_BG='NONE'
SEGMENT_SEPARATOR='\ue0c6'

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
    # echo $(pwd | sed -e "s,^$HOME,~," | sed "s@\(.\)[^/]*/@\1/@g")
    # echo $(pwd | sed -e "s,^$HOME,~,")
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
# prompt_context() {
#   local user=`whoami`

#   if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#     prompt_segment black default "%(!.%{%F{yellow}%}.)\uf015"
#   fi
# }

# Git: branch/detached head, dirty status
prompt_git() {
  local ref dirty
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    ZSH_THEME_GIT_PROMPT_DIRTY='±'
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
    if [[ -n $dirty ]]; then
      prompt_segment yellow black
    else
      prompt_segment green black
    fi
    echo -n "\uf408  \uf417 $(git log --pretty=format:'%h' -n 1) ${ref/refs\/heads\// }$dirty"
  fi
}

# Dir: current working directory
prompt_dir() {
  prompt_segment blue black "%b%{%F{250}%}\uf015 \ue0b1  %3~"
  # prompt_segment blue black "…${PWD: -30}"
}

## Main prompt
build_prompt() {
#   prompt_context
  prompt_dir
  prompt_git
  prompt_end
}

#Adds a new line after each command
precmd() {
    # Print a newline before the prompt, unless it's the
    # first prompt in the process.
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo -n "\n"
    fi
}

PROMPT='%{%f%b%k%}$(build_prompt) '

TMOUT=1

TRAPALRM() {
    zle reset-prompt
}

build_right_prompt() {
    echo -n '%{%F{240}%}%*'
}

# You can type spectrum_ls in the terminal to see available colors
RPROMPT='$(build_right_prompt)'