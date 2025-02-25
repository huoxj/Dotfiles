ROOT_DIR=$(cd "$(dirname "$0")";pwd)

# Nvim
ln -s $ROOT_DIR/nvim ~/.config/

# Tmux
ln -s $ROOT_DIR/tmux/.tmux.conf ~/.tmux.conf
