# Activate fuzzy finder; install first if not already installed.
# https://github.com/junegunn/fzf
export FZF=${SMARTSHELL_PLUGINS}/fzf
[ -d ${FZF} ] || {
  echo "Installing fuzzy finder..."
  git clone --depth 1 https://github.com/junegunn/fzf.git ${FZF}
  # Install fuzzy finder, but don't allow it to configure the shell since
  # I configure them manually.
  ${FZF}/install --all --key-bindings --completion --no-update-rc --no-fish

  # fzf always generate .fzf.bash and .fzf.zsh in the home directory, so
  # moving the files under ${FZF} to have everything under the smart-shell/
  # folder for easier uninstallation.
  mv ~/.fzf.* ${FZF}
}
source ${FZF}/.fzf.${SMARTSHELL_SHELLTYPE}

# Install vimcat for a colorized cat command:
# https://www.vim.org/scripts/script.php?script_id=4325
[ -f ~/bin/vimcat ] || {
  echo "Downloading vimcat..."
  mkdir -p ~/bin
  wget https://www.vim.org/scripts/download_script.php?src_id=23422 -O ~/bin/vimcat
  chmod u+x ~/bin/vimcat
}

# Local bin directory
export PATH=${HOME}/bin:${PATH}

# Add aliases.
source $SMARTSHELL_HOME/aliases.sh