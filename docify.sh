#!/bin/bash

claat export codelab.md

CODELAB_FOLDER="flutter-firebase-codelab"

mv $CODELAB_FOLDER docs

cd docs

rm -rf img

cd $CODELAB_FOLDER

mv img ..
mv codelab.json ..
mv index.html ..

cd ..

rm -r $CODELAB_FOLDER

claat serve
