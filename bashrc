source ~/.bash/alias/aliases
source ~/.bash/iterm_functions
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

if [ "$TERM" != "dumb" ] && [ -n "$TERM" ]; then
  source ~/.bash/prompt
fi

eval "$(rbenv init -)"

# added by travis gem
[ -f /Users/melissapatterson/.travis/travis.sh ] && source /Users/melissapatterson/.travis/travis.sh
