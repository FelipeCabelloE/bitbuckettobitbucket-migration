#!/bin/bash
source ./env.txt
set -e
# Nombre de los repos separados por espacios
repos=()

for repo in "${repos[@]}"; do
  echo
  echo "* Processing $repo..."
  echo
  $sshbitbucket
  echo
  echo "* authentication with bitbucket..."
  echo
  git clone --bare git@bitbucket.org:$INSTITUTION_NAME/$repo.git 
  cd $repo.git
  echo
  echo "* $repo cloned"  
  echo
  echo "* mirroring $repo to bitbucket..."  
  echo
  git push --mirror git@bitbucket.org:$INSTITUTION_NAME_MIRROR/$repo.git   
  cd ..
  sleep 300  
done