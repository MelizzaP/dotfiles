source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config
if [ "$TERM" != "dumb" ]; then 
  source ~/.bash/git_colors
fi
set -o vi

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

