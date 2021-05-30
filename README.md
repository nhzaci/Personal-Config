# Personal Configuration

- Comprehensive installation and setup guide for future laptops

## Steps

1. Install [brew](https://brew.sh/)
1. Install [autojump](https://github.com/wting/autojump) by running `brew install autojump`
1. Install nvim `brew install neovim`
1. Re-direct nvim config to `.vimrc` by using the script below

```bash
# ~/.config/nvim/init.vim
if !exists('g:vscode')
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath=&runtimepath
  source ~/.vimrc
endif
```

5. Install [vim-plug](https://github.com/junegunn/vim-plug) by running command below

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

6. Copy .vimrc in github repo into local home `cp ./vimrc ~/.vimrc`

```bash
cp ./vimrc ~/.vimrc \
source ~/.vimrc
```

7. Open up vim and do `:PlugInstall` to install all dependencies
8. Copy .zshrc in github repo into local home

```bash
cp ./zshrc ~/.zshrc \
source ~/.zshrc
```
