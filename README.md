**Here lies some config**


mkdir -p ~/.config/nvim

cd ~/.config/nvim

git clone https://github.com/ankur5699/nvim_config

cp nvim_config/init.lua ./

rm -rf nvim_config

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
