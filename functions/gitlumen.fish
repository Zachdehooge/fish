function gitlumen --wraps='lumen draft | git commit -F -' --description 'alias gitlumen=lumen draft'
  lumen draft --context "create a subject message using the changes added to staging"
        
end
