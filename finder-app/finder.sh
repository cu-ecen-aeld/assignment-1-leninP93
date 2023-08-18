#!/bin/bash
filesdir=$1
searchstr=$2


validateFilesdir()
{
    if [ -z "$filesdir" ]
    then
        echo "Not value files dir"
        exit 1
    fi
}
validateSearchstr()
{
    if [ -z "$searchstr" ]
    then
        echo "Not value in search string"
        exit 1
    fi
}
#The -d flag tests whether the provided name exists and is a directory.
testDirectory()
{
    if [ -d $filesdir ]
    then
        echo "It is a directory"
    else
        echo "It is not a directory"
        exit 1
    fi
}
validateFilesdir
validateSearchstr
testDirectory

grep -R $searchstr $filesdir 
totalFiles="$(grep -R $searchstr $filesdir | wc -l)"
totalMatch="$(grep -R $searchstr $filesdir -o | wc -l)"
echo "The number of files are ${totalFiles} and the number of matching lines are ${totalMatch}"
