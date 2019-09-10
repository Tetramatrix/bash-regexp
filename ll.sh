#!/bin/bash
path=""

usage () {
    echo "Usage:"
    echo "ll.sh {path} -f/--filter {regexp}"
}

while [ "$1" != "" ]; do
    case $1 in
        -f | --filter )         shift
                                regex=$1                                
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                                                     # unknown option
                                path=$1
                                ;;
    esac
    shift
done

if [ "$path" != "" ] && [ "$regex" != "" ]; then
  find $path -regex $regex
else
 echo "Missing parameter!"
fi
