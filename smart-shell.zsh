source ${SMARTSHELL_HOME}/install-plugins.sh

# Activate Oh My Zsh; install it first if it is not.
source ${SMARTSHELL_HOME}/oh-my-zsh.zsh

# Source stuff common to bash and zsh
source ${SMARTSHELL_HOME}/smart-shell-common.sh

# Fuzzy finder already configures C-T for searching for file in the current
# directory hierarchy and C-R to search for command in the history. Adding
# C-f to search the content of the files in the current folder hierarchy.
__ss_fzf_file_content_search() {
  if [[ -n $SS_AG_COMMAND ]]; then
    local cmd="command $SS_AG_COMMAND --nobreak --noheading --nocolor . 2> /dev/null"
  else
    local cmd="command ag --nobreak --noheading --nocolor . 2> /dev/null"
  fi

  setopt localoptions pipefail no_aliases 2> /dev/null
  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" $(__fzfcmd) -m "$@" | while read item; do
    A="$(echo 'one_two_three_four_five' | cut -d'_' -f2)"
    filepath=$(echo $item | cut -d':' -f1)
    lineno=$(echo $item | cut -d':' -f2)
    echo vim +${lineno} ${filepath}
    break
  done
  local ret=$?
  echo
  return $ret
}
ss-fzf-file-content-widget() {
  LBUFFER="${LBUFFER}$(__ss_fzf_file_content_search)"
  local ret=$?
  zle reset-prompt
  return $ret
}
zle     -N   ss-fzf-file-content-widget
bindkey '^F' ss-fzf-file-content-widget




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
