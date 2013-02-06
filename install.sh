cd ~/.vim

git submodule init
git submodule update

echo "Updating plug-ins..."

vim +BundleInstall +qall

echo "Installing vimfiles..."

cp ~/.vimrc ~/.vimrc.old > /dev/null
rm ~/.vimrc > /dev/null

ln -s ~/.vim/vimrc ~/.vimrc

