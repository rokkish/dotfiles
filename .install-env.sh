#! /bin/zsh

apt_routine(){
  sudo apt update
  sudo apt upgrade
}

install_pyenv(){
  apt_routine

  sudo apt install -y \
  libffi-dev libssl-dev zlib1g-dev liblzma-dev tk-dev \
  libbz2-dev libreadline-dev libsqlite3-dev libopencv-dev \
  build-essential git

  PYENVDIR="$HOME/.pyenv"
  if [ -d "$PYENVDIR" ];
  then
	echo "installed pyenv!"
  else
	echo "not install pyenv"
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
  fi

}

install_pyenv

