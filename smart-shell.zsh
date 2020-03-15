# Source stuff common to bash and zsh
source ${SMARTSHELL_HOME}/smart-shell-common.sh

# Activate Oh My Zsh; install it first if it is not.
source ${SMARTSHELL_HOME}/oh-my-zsh.zsh

# Fuzzy finder already configures C-T for searching for file in the current
# directory hierarchy and C-R to search for command in the history. Adding
# C-f to search the content of the files in the current folder hierarchy.
# TODO fix for zsh shell
#bind -x '"\C-f": "ag --nobreak --noheading . | fzf"'
#search-in-files-content-widget() {
#  LBUFFER="${LBUFFER}$(__fsel)"
#  local ret=$?
#  zle reset-prompt
#  return $ret
#}
#zle     -N   search-in-files-content-widget
#bindkey '^F' search-in-files-content-widget
#
#bindkey '^F' 'ag --nobreak --noheading . | fzf'

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
