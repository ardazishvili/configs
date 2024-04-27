# install oh my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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

# peaksea color scheme
# follow https://www.vim.org/scripts/script.php?script_id=760
# download
mkdir ~/.vim/colors
mv ~/Downloads/peaksea.vim ~/.vim/colors

# install vim plugins
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/dense-analysis/ale ~/.vim/bundle/ale
# you complete me prerequisites
sudo apt install build-essential cmake vim-nox python3-dev
cd ~/.vim/bundle
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clangd-completer

# install git fugitive
mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/fugitive.git
vim -u NONE -c "helptags fugitive/doc" -c q

# install gitgutter
mkdir -p ~/.vim/pack/airblade/start
cd ~/.vim/pack/airblade/start
git clone https://github.com/airblade/vim-gitgutter.git
vim -u NONE -c "helptags vim-gitgutter/doc" -c q

# install vim surround
mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/surround.git
vim -u NONE -c "helptags surround/doc" -c q

# install formatters
cd ~/.vim/bundle/ && git clone https://github.com/vim-autoformat/vim-autoformat.git
cd ~/.vim/bundle/ && git clone https://github.com/rhysd/vim-clang-format.git
sudo apt-get install clang-format

#install vim commentary
mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/commentary.git
vim -u NONE -c "helptags commentary/doc" -c q

# install vim auto-pairs
git clone https://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs

# install vimspector
# download from releases https://github.com/puremourning/vimspector/releases
mkdir -p $HOME/.vim/pack
tar zxvf ~/Downloads/vimspector-linux-7943589419.tar.gz -C $HOME/.vim/pack

# vim a plugin. Download from https://www.vim.org/scripts/script.php?script_id=31 and put into ~/.vim/autoload
