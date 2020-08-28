mktask() {
  name=$1
  cmd="${@:2}"

  preamble="import os\nimport sys\nfrom invoke import task"

  if [ -z $cmd ]; then
      echo "mktask <name> <cmd with any args>"
      return 0
  fi

  test -f tasks.py || (echo $preamble >> tasks.py)
  \cat <<EOF >> tasks.py

@task
def $name(c):
    c.run(f"$cmd", echo=True, pty=True)
EOF
  $EDITOR tasks.py +
}

bb-to-gh() {
# Reference: http://www.blackdogfoundry.com/blog/moving-repository-from-bitbucket-to-github/
# See also: http://www.paulund.co.uk/change-url-of-git-repository

    echo git remote rename origin bitbucket
    echo git remote add origin git@github.com:iceye-ltd/$1.git
    echo git push origin master
    echo git remote rm bitbucket
}
