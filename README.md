# Register passwords in local
-----------------------------
git config credential.helper store

# Below is used to add a new remote
-----------------------------------
git remote add origin git@github.com:User/UserRepo.git

# Below is used to change the url of an existing remote repository
------------------------------------------------------------------
git remote set-url origin git@github.com:User/UserRepo.git

# Get remote point
------------------
git remote -v

# Push to origin
----------------
git push -u origin master