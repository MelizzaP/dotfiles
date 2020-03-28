set blacklist README.md LICENSE Rakefile .gitignore .gitmodules

function install_brew
  echo "Checking for homebrew"
  if which brew
    echo "Updating brew"
    brew update
  else
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install
  end
end

function install_brew_packages
  for package in fzf heroku lolcat yarn postgres redis yarn prettier ripgrep tmux alacritty
    if brew list $package
      echo $package already installed
    else
      brew install $package
    end
  end
end

function setup_neovim
  mkdir -p ~/.config
  ln -ns ~/.vim ~/.config/nvim
  ln -s ~/.vimrc ~/.config/nvim/init.vim
end

function setup_fish
  ln -s $PWD/fish $HOME/.config/fish
end

function create_local_files
  touch ~/.vimrc.local
  touch ~/.gvimrc.local
  touch $HOME/.localrc
end

function install_fonts
  bin/install_powerline_fonts.s
end

function initialize_submodules
  git submodule update --init --recursive
  git submodule status
end

function setup_configs
  for file in *
    if not contains $file $blacklist
      ln -s $PWD/$file $HOME/.$file
    end
  end
end

initialize_submodules
install_fonts
install_brew
install_brew_packages
setup_neovim
setup_fish
create_local_files
setup_configs
