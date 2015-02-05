#!/bin/bash
source subFunctions.sh
function check-opts 
{
#echo `env|grep Set`
if $(test "$pageNameSet" -eq 1)
  then
    echo "No valid page name was specified"
    echo "Exiting"
    return `false`
  
  fi
  if test "$fileNameSet" -eq 1
  then
  
    echo "No valid file was specified"
    echo "Exiting"

    return `false`
  fi
  if test "$tempateSet"  -eq 1
    then
    echo "No valid template file was specified"
    echo "Exiting"

    return `false`
   fi
  if [ "$TEMPLATE_NAME" = "untitled.html" ] 
  then
    echo "This file name is reserved for internal purposes\nCannot continue\nExiting" 
    return `false`
    fi

}
function genFile
{
  cp $TEMPLATE_NAME $fileName
}
function getBaseLinks
{
  hasLinks=no
  for page in `ls|grep .html`
  do
  {
    if [ "$page" = "$fileName" ]
    then
      continue    
        
    fi
    #echo "$page" #debug
    seek-pages $page
    break
  }
 done
}
function addThisPage
{
#echo Pre funtion ENV: `env|grep Name`

  if [ "$linkPosition" = "" ]
  then
  sed -i "/position=\"endOfNav\"/i \
    <li id=\"NavLinks\"><a href=# id=\"NavLinks\" title=\"$pageName\"><strong>$pageName</strong></a></li>" $fileName
  fi
}
function addCurrentPageToOthers
{
   IFS=$'\n'       # make newlines the only separator
 
  for page in `ls -1|grep .html`
  do
  {
    if test "$page" = "$fileName"
    then    
      continue
    fi
    
    sed -i "/position=\"endOfNav\"/i \
     <li id=\"NavLinks\"><a id=\"NavLinks\" href=\"$fileName\" title=\"pageName\">$pageName</a></li>" $page #remeber, 12 spaces
  }
  done
}