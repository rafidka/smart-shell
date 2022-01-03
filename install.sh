export SMARTSHELL_HOME=~/smart-shell

# Clone the repository if it is not already cloned
[ -d ${SMARTSHELL_HOME} ] || {
  echo "Cloning smart-shell repository under ${SMARTSHELL_HOME}..."
  git clone https://github.com/rafidka/smart-shell.git ${SMARTSHELL_HOME}
}

# Ensure that .bash_profile imports smart-shell.
cat ~/.bash_profile | grep -q '>>> smart-shell >>>' || {
  echo "Updating .bash_profile..."
  cat <<TEXT >> ~/.bash_profile

# >>> smart-shell >>>
# !! Contents within this block are managed by smart-shell
[ -f ~/smart-shell/activate.sh ] && source ~/smart-shell/activate.sh
# <<< smart-shell<<<
TEXT
}

# Ensure that .zshrc imports smart-shell.
cat ~/.zshrc | grep -q '>>> smart-shell >>>' || {
  echo "Updating .zshrc..."
  cat <<TEXT >> ~/.zshrc

# >>> smart-shell >>>
# !! Contents within this block are managed by smart-shell
[ -f ~/smart-shell/activate.sh ] && source ~/smart-shell/activate.sh
# <<< smart-shell<<<
TEXT
}

echo "Done."
