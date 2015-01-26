#!/bin/bash
#mkfifo /tmp/functionOutput
export tempateSet=1
export pageNameSet=1
export fileNameSet=1
export TEMPLATE_NAME=""
export fileName=""
export pageName=""
export linkPosition=""
source ./functions.sh
if [ "$#" -lt 1 ]; then
    echo "Illegal number of parameters"
    exit `false`
fi

while getopts ":a::t::f::n::h" opt; do
  case $opt in
    t)
      tempateSet=0
      TEMPLATE_NAME="$OPTARG"
      ;;
    f)
      fileNameSet=0
      fileName="$OPTARG"
      ;;
    n)
      pageNameSet=0
      pageName="$OPTARG"

      ;;
    a)
    linkPosition="$OPTARG"
    ;;
      
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
      
  esac
done
#echo Pre funtion ENV1: `env|grep Name`
# #make sure all needed options are set
#  check-opts
#  set Continue=`check-opts`
# if [ $Continue = `false` ]
# then
# echo errors Encountered
# echo exiting
# exit `false`
# fi
 genFile
 getBaseLinks
 addThisPage
 addCurrentPageToOthers
 