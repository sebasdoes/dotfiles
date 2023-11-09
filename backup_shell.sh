mkdir -p home/.config
mkdir -p home/.vim

## Folders
cp -R ~/.config/terminator home/.config/
cp -R ~/.config/kitty home/.config/
cp -R ~/.config/nvim-custom home/.config/
cp -R ~/.vim/colors home/.vim/

## Files
cp ~/.config/starship.toml home/.config/starship.toml
cp ~/.config/vim_configs.vim home/.config/vim_configs.vim
cp ~/.vimrc home/.vimrc
cp ~/.zshrc home/.zshrc
cp ~/.zimrc home/.zimrc
