#!/bin/sh

echo " ======================= "
echo " Updating master branch"
echo " ======================= "

if git diff-index --quiet HEAD --; then
    rm -rf _site
    rm -rf .public

    jekyll build
    mv _site .public

    git co master

    rm -rf *
    mv .public/* .
    rm -rf .public

    echo " ======================== "
    echo "            WIN          "
    echo " ======================== "
    echo " Please check the updated site and checkin ..."
else
    echo " ======================== "
    echo "            FAIL          "
    echo " ======================== "
    echo "You have changes not checked-in - cannot automatically update master"
fi
