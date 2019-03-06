source ~/.bash/alias/aliases
source ~/.bash/iterm_functions
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

if [ "$TERM" != "dumb" ] && [ -n "$TERM" ]; then
  source ~/.bash/prompt
fi

# added by travis gem
[ -f /Users/melissapatterson/.travis/travis.sh ] && source /Users/melissapatterson/.travis/travis.sh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/melissapatterson/code/matte-daemon/node_modules/tabtab/.completions/serverless.bash ] && . /Users/melissapatterson/code/matte-daemon/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/melissapatterson/code/matte-daemon/node_modules/tabtab/.completions/sls.bash ] && . /Users/melissapatterson/code/matte-daemon/node_modules/tabtab/.completions/sls.bash
