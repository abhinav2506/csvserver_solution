#!/bin/bash

# Test Comment
if [[ $# -eq 0 ]]
then
    totaliter=10
elif [[ $# -eq 1 ]]
then
    totaliter=$1
else
    totaliter=0
fi

currentDir=`dirname $0`
outputFile="${currentDir}/inputFile"

if [[ -f ${outputFile} ]]
then
    rm ${outputFile}
fi

for ((i = 1 ; i <= $totaliter; i++))
do
    echo "$i, $RANDOM" >> ${outputFile}
done
