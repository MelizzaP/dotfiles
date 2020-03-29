
############ General ############
function reload
  source ~/.config/fish/config.fish
end

function local
  source ~/.localrc
end

function kill-port
  kill -kill lsof -t -i :$argv
end

########### Git ###############
function gsq
  git rebase -i HEAD-$argv
end

function conflicts
  git ls-files -u
end

function force-push
  git push --force-with-lease
end

function ga
  git add $argv
end

function gas
  git add $argv
  git status
end

function gb
  git branch
end

function gbg
  git branch | grep
end

function gco
  git checkout $argv
end

function gd
  git diff
end

function gdc
  git diff --cached
end

function gm
  git commit -m $argv
end

function gl
  git pull
end

function amend
  git commit --amend
end

function gs
  git status
end

function gst
  git stash
end

function gsp
  git stash pop
end

function fetch-n-force
  git fetch
  git rebase origin/master
  force-push
end
