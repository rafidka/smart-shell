# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=${SMARTSHELL_PLUGINS}/oh-my-zsh

# TODO: Should the installation part be moved to install-plugins.sh?
[ -d ${ZSH} ] || {
  git clone https://github.com/ohmyzsh/ohmyzsh.git ${ZSH}
}

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Comment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Install agnoster theme (the original one, not the one under oh-my-zsh)
# https://github.com/agnoster/agnoster-zsh-theme
[ -f ${ZSH_CUSTOM:-${ZSH}/custom}/themes/agnoster-original.zsh-theme ] || {
  echo "Downloading Agnoster theme from its original repository..."
  wget -O ${ZSH_CUSTOM:-${ZSH}/custom}/themes/agnoster-original.zsh-theme https://raw.githubusercontent.com/agnoster/agnoster-zsh-theme/master/agnoster.zsh-theme
}

# Install zsh-syntax-highlighting.
[ -d ${ZSH_CUSTOM:-${ZSH}/custom}/plugins/zsh-syntax-highlighting ] || {
  echo "Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-${ZSH}/custom}/plugins/zsh-syntax-highlighting
}

# Install zsh-autosuggestions:
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
[ -d ${ZSH_CUSTOM:-${ZSH}/custom}/plugins/zsh-autosuggestions ] || {
  echo "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-${ZSH}/custom}/plugins/zsh-autosuggestions
}

# Install zsh-completions:
# https://github.com/zsh-users/zsh-completions#oh-my-zsh
[ -d ${ZSH_CUSTOM:-${ZSH}/custom}/plugins/zsh-completions ] || {
  echo "Installing zsh-completions..."
  git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-${ZSH}/custom}/plugins/zsh-completions
}

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster-original"

# Which plugins would you like to load?
# Standard plugins can be found in ${ZSH}/plugins/*
# Custom plugins may be added to ${ZSH}/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    autojump
    git
    zsh-autosuggestions
    zsh-completions
    zsh-interactive-cd
)

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Add macos plugin
  plugins=(${plugins[@]} macos)
fi

# Add zsh-syntax-highlighting plugin; it must be the last:
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
plugins=(${plugins[@]} zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize the prompt for agnoster theme:
# - The segment 'prompt_virtualenv' doesn't work with conda, so creating a custom one.
# - Re-order the segments
# TODO
# - show current datetime
# - show battery percentage
function ss_prompt_python_env() {
  local python_venv=""

  if [[ -n "${CONDA_DEFAULT_ENV}" ]]; then
    python_venv="(c) ${CONDA_DEFAULT_ENV}"
  elif [[ -n "${VIRTUAL_ENV}" ]]; then
    python_venv=$(basename "${VIRTUAL_ENV}")
  fi

  if [[ -n $python_venv ]]; then
    color=cyan
    prompt_segment $color $PRIMARY_FG
    print -Pn " ${python_venv} "
  fi
}

# Customized version of prompt_context which:
# - Uses yellow color instead of the default color
# - Allow setting custom label through the SS_ZSH_CUSTOM_PROMPT variable
function ss_prompt_context() {
  if ! [[ -z $SS_ZSH_CUSTOM_PROMPT ]]; then
    local user="$SS_ZSH_CUSTOM_PROMPT"
    color=red
    prompt_segment $color $PRIMARY_FG " $user "
  else
    local user=`whoami`

    if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CONNECTION" ]]; then
      color=red
      prompt_segment $color $PRIMARY_FG " %(!.%{%F{yellow}%}.)$user@%m "
    fi
  fi
}
PRIMARY_FG=white
AGNOSTER_PROMPT_SEGMENTS=(prompt_status ss_prompt_context ss_prompt_python_env prompt_dir prompt_git prompt_end)

DEFAULT_USER=rafid

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
