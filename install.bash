SMART_BASH=~/smart-bash

# Clone the repository if it is not already cloned
[ -d ${SMART_BASH} ] || git clone https://github.com/rafidka/smart-bash.git ${SMART_BASH}

# Ensure that .bashrc imports smart-bash.
cat ~/.bashrc | grep -q '>>> smart-bash >>>' || {
  cat <<TEXT >> ~/.bashrc
# >>> smart-bash >>>
# !! Contents within this block are managed by smart-bash
[ -f ~/smart-bash/activate.bash ] && source ~/smart-bash/activate.bash
# <<< smart-bash<<<
TEXT
}

cat ~/.vimrc | grep -q '>>> smart-bash >>>' || {
  cat <<TEXT >> ~/.vimrc
" >>> smart-bash >>>
" !! Contents within this block are managed by smart-bash
:so ~/smart-bash/vimrc.vim
" <<< smart-bash <<<
TEXT
}