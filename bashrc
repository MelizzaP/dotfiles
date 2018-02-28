source ~/.bash/alias/aliases
source ~/.bash/iterm_functions
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config
source ~/.profile

if [ "$TERM" != "dumb" ] && [ -n "$TERM" ]; then
  source ~/.bash/prompt
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# added by travis gem
[ -f /Users/melissapatterson/.travis/travis.sh ] && source /Users/melissapatterson/.travis/travis.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
