source ~/.bash/alias/aliases
source ~/.bash/iterm_functions
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

if [ "$TERM" != "dumb" ] && [ -n "$TERM" ]; then
  source ~/.bash/prompt
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
