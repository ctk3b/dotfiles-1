# symlink all dotfiles to home directory
hash rcup 2>/dev/null || { echo >&2 "Please install rcm.  Aborting."; exit 1; }
rcup -x README.md -x install.sh -x Sublime

# Install VIM plugins
hash vim 2>/dev/null || { echo >&2 "Please install vim. Aborting."; exit 1; }

if "test ! -d ~/.vim/bundle/Vundle.vim" \
   "run 'git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'"
vim +PluginInstall +qall

# Install TMUX plugins
hash tmux 2>/dev/null || { echo >&2 "Please install tmux. Aborting."; exit 1; }
if "test ! -d ~/.tmux/plugins/tpm" \
   "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm'"
~/.tmux/plugins/tpm/bin/install_plugins
