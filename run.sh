#!/bin/bash
# script to run the program
# ./run.sh 1

# get the userId of the email
menu=$1
WORKING_DIR="/home/aal/Workspace/Lab/abdullahainun.github.io"
cd $WORKING_DIR
if [ "$menu" == 'generate' ];
then
    notablog generate .
    echo $'\nGenerate Pages Successfully!\n'
elif [ "$menu" == 'preview' ];
then
    notablog preview .
    echo $'\nNotablog Preview!\n'
elif [ "$menu" == 'serve' ];
then
    notablog generate . && notablog preview .
    echo $'\nGenerate Pages Successfully!\n'
elif [ "$menu" == 'deploy' ];
then
    cd $WORKING_DIR/public
    git add . && git commit -m "update pages" && git push origin main
    cd $WORKING_DIR
    echo $'\nDeploy Successfully!\n'
else
    echo 'not valid param input. exiting...'    
    exit 1
fi