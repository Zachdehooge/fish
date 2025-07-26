function gitclean --wraps='git remote prune origin' --description 'alias gitclean=git remote prune origin'
  git remote prune origin $argv
        
end
