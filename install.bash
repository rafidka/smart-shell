SMART_BASH=~/smart-bash

# Clone the repository if it is not already cloned
[ -d ${SMART_BASH} ] || {
  echo "Cloning smart-bash repository under ${SMART_BASH}..."
  git clone https://github.com/rafidka/smart-bash.git ${SMART_BASH}
}

# Ensure that .bash_profile imports smart-bash.
cat ~/.bash_profile | grep -q '>>> smart-bash >>>' || {
  echo "Updating .bash_profile..."
  cat <<TEXT >> ~/.bash_profile
# >>> smart-bash >>>
# !! Contents within this block are managed by smart-bash
[ -f ~/smart-bash/activate.bash ] && source ~/smart-bash/activate.bash
# <<< smart-bash<<<
TEXT
}

cat ~/.vimrc | grep -q '>>> smart-bash >>>' || {
  echo "Updating .vimrc..."
  cat <<TEXT >> ~/.vimrc
" >>> smart-bash >>>
" !! Contents within this block are managed by smart-bash
:so ~/smart-bash/vimrc.vim
" <<< smart-bash <<<
TEXT
}

echo "Done."