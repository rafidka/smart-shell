# Add colors and a '/' after directory names.
if [ `uname` == Darwin ]; then
  # ls on macOS uses -G for colors
  alias ls='ls -GF'
else
  alias ls='ls -F --color'
fi

# Change to temp/ directory, and create it if it is not created
alias t="mkdir -p ~/temp && cd ~/temp"

# Generate a random password
alias passgen="openssl rand -base64 32"

# Opens nvim in a temporary file. Useful for quickly jotting down some notes in
# Vim.
alias notes='nvim `mktemp /tmp/vim.temp.file.XXXXXX`'

# Easy alias to run ipython
alias py=ipython

# Show processes consuming memories, sorted from high to low.
alias topmem="ps -eo pmem,pcpu,vsize,pid,cmd | sort -k 1 -nr"
