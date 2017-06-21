function lgit() {
 if [[ $# -eq 0 ]] ; then
    echo 'Add a Comment'
  exit 1
 fi 
 
 git add .
 git commit -a -m "$*"
}

function pgit() {
   git push
}
