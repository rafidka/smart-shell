source ${SMARTSHELL_HOME}/install-plugins.sh

# Activate Oh My Zsh; install it first if it is not.
source ${SMARTSHELL_HOME}/oh-my-bash.bash

# Source stuff common to bash and zsh
source ${SMARTSHELL_HOME}/smart-shell-common.sh

# Fuzzy finder already configures C-T for searching for file in the current
# directory hierarchy and C-R to search for command in the history. Adding
# C-f to search the content of the files in the current folder hierarchy.
bind -x '"\C-f": "ag --nobreak --noheading . | fzf"'

# Shell Options
shopt -s histappend # Ensure commands executed by multiple shells are all saved
shopt -s histreedit
shopt -s cdspell # Auto fix small mistakes in CD command
shopt -s dirspell # Auto fix dir name on tab completion

export HISTTIMEFORMAT="%h %d %H:%M:%S " # Add date and time to history
export HISTCONTROL=ignoredups:erasedups # No duplicate entries
export HISTSIZE=1000000                 # Increase  history size
export HISTFILESIZE=1000000             # Increase  history size

# Git auto complete: https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks
[ -f ~/bin/git-completion.bash ] && [ -f ~/bin/git-prompt.sh ] || {
  echo "Downloading git prompt and auto-completion..."
  mkdir -p ~/bin
  wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/bin/git-completion.bash
  wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/bin/git-prompt.sh
}
source ~/bin/git-completion.bash
source ~/bin/git-prompt.sh