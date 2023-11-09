mkdir -p ~/.config
mkdir -p ~/.vim
mkdir -p ~/.vim_runtime

## Folders
cp -R home/.config/terminator ~/.config/
cp -R home/.config/kitty ~/.config/
cp -R home/.config/nvim-custom ~/.config/
cp -R home/.vim/colors ~/.vim/

## Files
cp home/.config/starship.toml ~/.config/starship.toml
cp home/.config/vim_configs.vim ~/.config/vim_configs.vim
cp home/.vimrc ~/.vimrc
cp home/.zshrc ~/.zshrc
cp home/.zimrc ~/.zimrc
