#!/bin/bash
function seek-pages
{
  # Ugly hack, sed was not cooperating
  #------------------------------------
  HostPageLink=`cat $1|grep NavLinks|grep strong`
  echo $HostPageLink >temp.txt
  # using "@" as delimeter for sed
  sed -i "s@#@$1@" temp.txt
  sed -i "s@<strong>@""@" temp.txt
  sed -i "s@</strong>@""@" temp.txt
  HostPageLink=`cat temp.txt`
  rm temp.txt
  #-----------------------------------
  IFS=$'\n'       # make newlines the only separator
      #echo "Files: `ls -1 |grep NavLinks $1`" # debug
      
  for links in `ls -1 |grep NavLinks $1`
  do
  {
    if [ `echo $links| grep strong` != "" ]
    then
    sed -i "/position=\"endOfNav\"/i \
    $HostPageLink" "$fileName"
    continue
    fi
    sed -i "/position=\"endOfNav\"/i \
    $links" "$fileName"
  }
done
}
