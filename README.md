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
  - [Bash](#bash)
  - [Git](#git)
  - [Vim Features](#vim-features)
- [Installation](#installation)

# Features

## Bash

- A list of predefined configurations to improve the bash experience, for example:
  - Update the prompt (PS1) to be more colorful!
  - Increase command history to a million so you don't lose any command from your history.
  - Some useful aliases.
- A colored version of `cat` using [vimcat](https://www.vim.org/scripts/script.php?script_id=4325). Just type `vimcat <filename>` to display file with highlighting.
- A random password generator. Try it by calling: `passgen`.
- Update `ls` to show colorful output.
- Install [fzf](https://github.com/junegunn/fzf) for fuzzy finding:
  - Use Ctrl-T to search for files in the current hierarchy.
  - Use Ctrl-F to search the content of files in the current hierarchy.
  - Use Ctrl-R to search command history using fuzzy funder.

## Git

- Enable git auto completion.
- Update PS1 to show the current branch if inside a Git repository.

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

# Installation

`smart-bash` can be installed with the following command:

```
wget -qO- https://raw.githubusercontent.com/rafidka/smart-bash/master/install.bash | bash
```

This will do the following:

1. Clone the repository under `~/smart-bash`.
1. Update `.bashrc` file to source `~/smart-bash/activate.bash`. This file, on the other hand, ensures that the repository is up-to-date and then source the `~/smart-bash/smart-bash.bash` file.
1. Upon execution, `smart-bash.bash` will also install Fuzzy Finder under `~/.fzf`.
1. Update `.vimrc` to source `~/smart-bash/vimrc.vim`.

It is also worth mentioning that depending on whether you are running bash in
interactive or non-interactive mode, either `.bashrc` or `.bash_profile` will
be loaded. It is possible to put all your configuration in `.bashrc` and then
in `.bash_profile` you simply source `.bashrc` like:
```bash
[ -f ~/.bashrc ] && . ~/.bashrc
```
