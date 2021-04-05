# Install fuzzy finder if not installed: https://github.com/junegunn/fzf
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

# Install vimcat for a colorized cat command:
# https://www.vim.org/scripts/script.php?script_id=4325
[ -f ${SMARTSHELL_PLUGINS}/vimcat ] || {
  echo "Downloading vimcat..."
  mkdir -p ${SMARTSHELL_PLUGINS}
  wget 'https://www.vim.org/scripts/download_script.php?src_id=23422' -O ${SMARTSHELL_PLUGINS}/vimcat
  chmod u+x ${SMARTSHELL_PLUGINS}/vimcat
}
