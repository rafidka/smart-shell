# Add colors and a '/' after directory names.
if [[ "`uname`" == "Darwin" ]]; then
  # ls on macOS uses -G for colors
  alias ls='ls -GF'
else
  alias ls='ls -F --color'
fi

# Change to temp/ directory; create it if it is not created.
alias t="mkdir -p ~/temp && cd ~/temp"

# Generate a random password
alias newpass="openssl rand -base64 32"

# Opens vim in a temporary file. Useful for quickly jotting down some notes in
# Vim.
alias draft='file=`mktemp /tmp/vim.temp.file.XXXXXX`; vim $file; echo $file'

# Easy alias to run ipython. Excepts ipython to be installed
# TODO Automatically install ipython?!
alias py=ipython

# Show processes consuming memories, sorted from high to low.
alias topmem="ps -eo pmem,pcpu,vsize,pid,cmd | sort -k 1 -nr"
alias topcpu="ps -eo pmem,pcpu,vsize,pid,cmd | sort -k 2 -nr"

# Use vimcat to colorize cat
alias vimcat=${SMARTSHELL_PLUGINS}/vimcat

# Commands for copying and pasting from clipboard in Linux.
if [[ "`uname`" == "Linux" ]]; then
    alias xcopy="xclip -selection c"
    alias xpaste="xclip -selection c -o"
fi
