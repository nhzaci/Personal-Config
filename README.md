# Personal Configuration

- Comprehensive installation and setup guide for future laptops

## Steps

1. Install [brew](https://brew.sh/)
2. Copy .vimrc in github repo into local home `cp ./vimrc ~/.vimrc`

```bash
cp ./vimrc ~/.vimrc
```

3. Install [vim-plug](https://github.com/junegunn/vim-plug) by running command below

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

4. Open up vim and do `:PlugInstall` to install all dependencies
5. Copy .zshrc in github repo into local home

```bash
cp ./zshrc ~/.zshrc \
source ~/.zshrc
```

6. Install [autojump](https://github.com/wting/autojump) by running `brew install autojump`
7. Install nvim `brew install neovim`
8. Re-direct nvim config to `.vimrc` by using the script below

```bash
# ~/.config/nvim/init.vim
if !exists('g:vscode')
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath=&runtimepath
  source ~/.vimrc
endif
```

9. Install Java with brew, `brew install java`
10. Create Java symlink using command `sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk`
11. Enable prettier to format on save for all files

```json
// In CocConfig
{
  "coc.preferences.formatOnSaveFileTypes": ["*"]
}
```

12. Install ruby `brew install ruby`
13. Install ruby env `brew install rbenv`
14. Install python3 `brew install python`
15. Install scala `brew install sbt`
16. Install ammonite repl `brew install ammonite-repl`
17. Install lookatme `pip3 install lookatme`
18. Install python nvim `pip3 install pynvim`
