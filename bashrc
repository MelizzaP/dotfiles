source ~/.bash/aliases
source ~/.bash/iterm_functions
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

if [ "$TERM" != "dumb" ] && [ -n "$TERM" ]; then
  source ~/.bash/prompt
fi
