ROOT_DIR=$(cd "$(dirname "$0")";pwd)

# Nvim
mkdir -p ~/.config/nvim
ln -s $ROOT_DIR/nvim ~/.config/nvim
