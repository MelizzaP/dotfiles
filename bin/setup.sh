
function linkDotfile {
  dest=${HOME}/.${1}
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
   # existing symlink
   echo "Removing existing symlink: ${dest}"
   rm ${dest}

  elif [ -f "${dest}" ]; then
    #existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s $PWD/${1} ${dest}
}

function brew_install {
  if brew list $1; then
    echo $1 already installed
  else
    brew install $1
  fi
}

function create_local_files {
  touch ~/.vimrc.local
  touch ~/gvimrc.local
}

function setup_neovim {
  mkdir -p ~/.config
  ln -ns ~/.vim ~/.config/nvim
  ln -s ~/.vimrc ~/.config/nvim/init.vim
}

function initialize_submodules {
  git submodule update --init --recursive && git submodule status
}

create_local_files
setup_neovim
initialize_submodules

echo "Linking files"
linkDotfile vim
linkDotfile vimrc
linkDotfile bashrc
linkDotfile bash_profile
linkDotfile tmux.conf
linkDotfile alacritty.yml
linkDotfile slate
echo "Installing brew packages"
brew_install fzf
brew_install lolcat
brew_install yarn
brew_install postgres
brew_install ripgrep
brew_install tmux
