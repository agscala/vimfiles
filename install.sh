cd ~/.vim

vim +'PlugInstall --sync' +qa
mkdir -p ~/.config/nvim

ln -s ~/.vim/vimrc ~/.config/nvim/init.vim

