This repository contains a set of opinionated configurations to improve the
bash experience. I use bash a lot in my day to day job and outside it. One
thing I frequently struggle with is when I have to work on another machine,
e.g. a server on the cloud, and then I lose all of the configurations I
have on my local machine. This problem becomes particularly bothering for
me since I have to frequently create new machines on the cloud, making it
difficult to apply the new configurations over and over. Furthermore, I
might discover a new nice configuration I want to apply, but then I have to
apply it on all machines. As such, I decided to push all the common
configurations to GitHubs

# Table of Contents

- [Table of Contents](#table-of-contents)
- [Features](#features)
  - [Shell (Z shell and Bash)](#shell-z-shell-and-bash)
  - [Vim Features](#vim-features)
- [Installation](#installation)
  - [Bash Users](#bash-users)

# Features

## Shell (Z shell and Bash)

- Z shell: Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) for improved experience.
- Bash: Install [oh-my-bash](https://github.com/ohmybash/oh-my-bash/) for improved experience.
- Increase command history to a million so you don't lose any command from your history.
- Some useful aliases.
- A colored version of `cat` using [vimcat](https://www.vim.org/scripts/script.php?script_id=4325). Just type `vimcat <filename>` to display file with highlighting.
- A random password generator. Try it by calling: `newpass`.
- Install [fzf](https://github.com/junegunn/fzf) for fuzzy finding:
  - Use Ctrl-T to search for files in the current hierarchy.
  - Use Ctrl-F to search the content of files in the current hierarchy.
  - Use Ctrl-R to search command history using fuzzy funder.

## Vim Features

- A list of predefined configurations to improve the Vim experience, for example:
  - Enable auto indentation
  - Use spaces for indentation instead of tabs.
  - Increase command history to a million so you don't lose any command from your history.
  - Enable incremental search.
  - Enable ruler on the bottom
  - Show relative line numbers for easier navigation
  - Enable incremental search
  - ... and many other you can see in the [vimrc.vim] file.
- Automatically install [vim-plug](https://github.com/junegunn/vim-plug) to 
  make it easier to install Vim plugins.
- Install the following Vim plugins:
  - [bufexplorer](https://github.com/jlanzarotta/bufexplorer)
  - [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
  - [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
  - [fzf.vim](https://github.com/junegunn/fzf.vim)
  - [lightline.vim](https://github.com/itchyny/lightline.vim)
  - [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
  - [nerdtree](https://github.com/preservim/nerdtree)
  - [rust.vim](https://github.com/rust-lang/rust.vim)
  - [vim-fugitive](https://github.com/tpope/vim-fugitive)
  - [vim-prettier](https://github.com/prettier/vim-prettier)
  - [vim-code-dark](https://github.com/tomasiser/vim-code-dark)
  - [python-syntax](https://github.com/vim-python/python-syntax)
  - [rust-lang](https://github.com/rust-lang/rust.vim)
  - [vim-airline](https://github.com/vim-airline/vim-airline)
  - [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
  - [vim-go](https://github.com/fatih/vim-go)

# Installation

`smart-shell` can be installed with the following command:

```
wget -qO- https://raw.githubusercontent.com/rafidka/smart-shell/master/install.sh | sh
```

This will do the following:

1. Clone the repository under `~/smart-shell`.
1. Update `.zshrc` and `.bash_profile` files to source `~/smart-shell/activate.sh`. This file, on the other hand, ensures that the repository is up-to-date and then source the `~/smart-shell/smart-shell.{bash|zsh}` file.
1. Update `.vimrc` to source `~/smart-shell/vimrc.vim`.
1. Upon execution, `smart-shell.{bash|zsh}` will also install the necessary plugins.

## Bash Users

It is also worth mentioning that depending on whether you are running bash in
interactive or non-interactive mode, either `.bashrc` or `.bash_profile` will
be loaded. It is possible to put all your configuration in `.bashrc` and then
in `.bash_profile` you simply source `.bashrc` like:
```bash
[ -f ~/.bashrc ] && . ~/.bashrc
```
