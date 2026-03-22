#!/bin/bash

cd apps/apis || exit

FILES=$(git diff --name-only --cached | grep "^apps/apis/.*\.php$" | sed "s|apps/apis/||")

if [ -z "$FILES" ]; then
  echo "No PHP files to format"
  exit 0
fi

./vendor/bin/pint --path=$FILES