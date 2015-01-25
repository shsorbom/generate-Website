#!/bin/bash
function seek-pages
{
  IFS=$'\n'       # make newlines the only separator
      #echo "Files: `ls -1 |grep NavLinks $1`" # debug
  for links in `ls -1 |grep NavLinks $1`
  do
  {
    sed -i "/position=\"endOfNav\"/i \
    $links"
  }
done
HostPageLink=`cat $1|grep NavLinks|grep strong`
# Ugly hack, sed was not cooperating
#------------------------------------
echo $HostPageLink >temp.txt
# using "@" as delimeter for sed
sed -i "s@#@$1@" temp.txt
sed -i "s@<strong>@""@" temp.txt
sed -i "s@</strong>@""@" temp.txt
HostPageLink=`cat temp.txt`
rm temp.txt
#-----------------------------------
echo new link: 
echo $HostPageLink
}
