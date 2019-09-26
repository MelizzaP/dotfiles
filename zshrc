# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

# Pre-load .localrc for custom theme selection
ZSH_THEME_SELECTED="$ZSH_THEME"

# Load oh-my-zsh
ZSH=$HOME/.oh-my-zsh
plugins=(
  $plugins
  asdf
  aws
  brew
  bundler
  command-not-found
  common-aliases
  colorize
  colored-man-pages
  copyfile
  debian
  docker
  gitfast
  git-extras
  gem
  heroku
  history
  jsontools
  node
  npm
  osx
  rails
  ruby
  rvm
  svn
  web-search
  yarn
  yum
)

if [[ "$unamestr" == 'Darwin' ]]; then
  # Include osx plugin on osx
  plugins=($plugins osx)
fi

DISABLE_AUTO_UPDATE="true"
. ~/.oh-my-zsh/oh-my-zsh.sh

# Load syntax highlight
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Disable auto-correct
unsetopt correct_all

# Bash settings
. ~/.bash/alias/aliases
. ~/.bash/paths
. ~/.bash/config

# Other zsh settings
. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion
. ~/.zsh/prompt

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
FZF_DEFAULT_COMMAND="bash -c 'sort -u <( rg --files  ) <( git ls-files  )'"

if  [[ -f ~/.asdf ]]; then
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
fi
