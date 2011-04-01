cd ~/.vim
echo "Updating plug-ins..."
mkdir -p bundle-autoupdate
ruby update_bundles

echo "Installing vimfiles..."

cp ~/.vimrc ~/.vimrc.old > /dev/null
rm ~/.vimrc > /dev/null

ln -s ~/.vim/vimrc ~/.vimrc

