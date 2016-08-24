#!/bin/bash

deploy () {
    echo "----------------------------"
    echo "Running deploy"
    echo "----------------------------"
    echo "destination:"
    git config --get remote.origin.url
    echo "----------------------------"
    echo "UPDATING - master Branch"
    git push origin master
    echo "----------------------------"
    echo "UPDATING - gh-pages Branch"
    git push origin `git subtree split --prefix optimized master`:gh-pages --force
    echo "----------------------------"
    echo "DEPLOY COMPLETED"
    echo "----------------------------"
    exit 0
}

confirm () {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case $response in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

if [[ -n $(git status --porcelain) ]]; then
  echo "----------------------------"
  echo "DEPLOY TO GITHUB PAGES"
  echo "----------------------------"
  echo "The repo seems to be dirty."
  confirm "Would you really like to do a deploy?" && deploy
  exit 0
else
  echo "The repo seems to be clean."
  deploy
fi
