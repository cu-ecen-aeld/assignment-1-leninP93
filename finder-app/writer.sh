#!/bin/bash
writefile=$1
writestr=$2

CHECKDIR=$( dirname "$writefile" )
validateFilesdir()
{
    if [ -z "$writefile" ]
    then
        echo "Not value files dir"
        exit 1
    fi
}
validateSearchstr()
{
    if [ -z "$writestr" ]
    then
        echo "Not value in search string"
        exit 1
    fi
}
validateFilesdir
validateSearchstr

if [[ ! -e "$CHECKDIR" ]]; then
    mkdir -p "$CHECKDIR"
    touch $writefile 
    echo $writestr > $writefile
fi

if [[ ! -f "$writefile" ]]; then
    touch $writefile
fi

echo $writestr > $writefile
