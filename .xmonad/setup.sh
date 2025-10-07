sudo apt-get install zsh

# install oh my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/ardazishvili/configs
cd configs

# copy zsh configs from github repo
cp .zshrc ~/
cp .zshrc.pre-oh-my-zsh ~/

# install zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install zsh syntax highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# copy vim config from github repo
cp .vimrc ~/
sudo apt-get install curl

mkdir ~/.vim
mkdir ~/.vim/colors
mkdir ~/.vim/autoload
git clone https://github.com/tpope/vim-pathogen.git # copy to ~/.vim/autoload
git clone https://github.com/vim-scripts/a.vim.git # copy to ~/.vim/autoload
git clone https://github.com/vim-scripts/peaksea.git # copy to ~/.vim/colors
cp vim-pathogen/autoload/pathogen.vim ~/.vim/autoload
cp a.vim/plugin/a.vim ~/.vim/autoload
cp peaksea/colors/peaksea.vim ~/.vim/colors

# install vim plugins
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/dense-analysis/ale ~/.vim/bundle/ale

# install git fugitive
mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://github.com/tpope/vim-fugitive
vim -u NONE -c "helptags fugitive/doc" -c q

# install gitgutter
mkdir -p ~/.vim/pack/airblade/start
cd ~/.vim/pack/airblade/start
git clone https://github.com/airblade/vim-gitgutter.git
vim -u NONE -c "helptags vim-gitgutter/doc" -c q

# install vim surround
mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://github.com/tpope/vim-surround
vim -u NONE -c "helptags surround/doc" -c q

# install formatters
cd ~/.vim/bundle/ && git clone https://github.com/vim-autoformat/vim-autoformat.git
cd ~/.vim/bundle/ && git clone https://github.com/rhysd/vim-clang-format.git
sudo apt-get install clang-format

#install vim commentary
mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://github.com/tpope/vim-commentary
vim -u NONE -c "helptags commentary/doc" -c q

# install vim auto-pairs
git clone https://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs

# you complete me prerequisites
sudo apt install build-essential cmake vim-nox python3-dev
mkdir ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/ycm-core/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
python3 install.py --clangd-completer

# install vimspector
# download from releases https://github.com/puremourning/vimspector/releases
mkdir -p $HOME/.vim/pack
tar zxvf ~/Downloads/vimspector-linux-7943589419.tar.gz -C $HOME/.vim/pack

sudo apt-get install xmonad xmobar compton libghc-dbus-dev polybar rofi
mkdir -p ~/.xmonad
cd <configs_dir>
cp .xmonad/* ~/.xmonad
cp .xmobarrc ~/

cp ~/repos/configs/polybar/config.ini ~/.config/polybar/

# source code pro installation
wget https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip
unzip 1.050R-it.zip
fontpath="${XDG_DATA_HOME:-$HOME/.local/share}"/fonts
mkdir -p $fontpath
cp source-code-pro-*-it/OTF/*.otf $fontpath
fc-cache -f -v
# then setup appearance of terminal emulator, e.g. konsole

wget https://github.com/xintron/xmonad-log/releases/download/0.1.0/xmonad-log-0.1.0-linux-amd64.zip
unzip xmonad-log-0.1.0-linux-amd64.zip
cp xmonad-log ~/.local/bin
