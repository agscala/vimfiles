cd ~/.vim

# curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           # https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp ~/.vim/init.vim ~/.config/nvim/init.vim

vim +'PlugInstall --sync' +qa
mkdir -p ~/.config/nvim


