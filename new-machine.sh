# Install apps
./brew.sh

# Config git
./gitconfig.sh

mkdir -p ~/.config

# Link files
ln -s $PWD/zsh/.zshrc ~/.zshrc
ln -s $PWD/.gitignore ~/.gitignore
ln -s $PWD/starship.toml ~/.config/starship.toml
