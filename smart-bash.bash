[ -f $HOME/smart-bash/bash_colors.bash ] && source "$HOME/smart-bash/bash_colors.bash"

# https://github.com/junegunn/fzf
[ -f ~/.fzf.bash ] || {
  echo "Installing fuzzy finder..."
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}
source ~/.fzf.bash

# Fuzzy finder already configures C-T for searching for file in the current
# directory hierarchy and C-R to search for command in the history. Adding
# C-f to search the content of the files in the current folder hierarchy.
bind -x '"\C-f": "ag --nobreak --noheading . | fzf"'

# Shell Options
shopt -s histappend # Ensure commands executed by multiple shells are all saved
shopt -s histreedit
shopt -s cdspell # Auto fix small mistakes in CD command
shopt -s dirspell # Auto fix dir name on tab completion

# Increase  history size
HISTSIZE=1000000
HISTFILESIZE=1000000

# Git auto complete: https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks
[ -f ~/bin/git-completion.bash ] && [ -f ~/bin/git-prompt.sh ] || {
  echo "Downloading git prompt and auto-completion..."
  mkdir -p ~/bin
  wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/bin/git-completion.bash
  wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/bin/git-prompt.sh
}
source ~/bin/git-completion.bash
source ~/bin/git-prompt.sh
PS1="${B_GREEN}\u@\h${B_BLUE} [\w${B_RED}"'$(__git_ps1 " ~(%s)")'"${B_BLUE}]${RESET} "

# Local bin directory
export PATH=$HOME/bin:$PATH

# Add colors and a '/' after directory names.
alias ls='ls -GF --color'

# Use vimcat to colorize cat
# https://www.vim.org/scripts/script.php?script_id=4325
[ -f ~/bin/vimcat ] || {
  echo "Downloading vimcat..."
  mkdir -p ~/bin
  wget https://www.vim.org/scripts/download_script.php?src_id=23422 -O ~/bin/vimcat
  chmod u+x ~/bin/vimcat
}
alias vimcat=~/bin/vimcat

# Change to temp/ directory, and create it if it is not created
alias t="mkdir -p ~/temp && cd ~/temp"

# Generate a random password
alias passgen="openssl rand -base64 32"

# Opens nvim in a temporary file. Useful for quickly jotting down some notes in
# Vim.
alias notes='nvim `mktemp /tmp/vim.temp.file.XXXXXX`'

# Easy alias to run ipython
alias py=ipython
