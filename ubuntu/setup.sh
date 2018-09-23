sudo apt update
sudo apt upgrade -y

sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \ 
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev git zsh vim \
vim-gnome tmux curl python python3 python-pip python3-pip

sudo apt autoclean && sudo apt autoremove 

git config --global user.email "adlermedrado@gmail.com"
git config --global user.name "Adler Medrado"

curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

pip install --user pipenv
