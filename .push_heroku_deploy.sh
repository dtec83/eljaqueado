#!/bin/bash

GH_REPO="@github.com/jaquerespeis/eljaqueado.git"

FULL_REPO="https://$GH_TOKEN$GH_REPO"

cd deploy

git init
git config user.name "jaquerespeis-travis"
git config user.email "travis"

git add .
git commit -m "Deployed to heroku."
git push --force --quiet $FULL_REPO master:heroku-deploy
