#!/bin/bash
# Setup the C9 (Or any linux, ubunu, enviroment) to be a github based project.
#Set some basic Vars...
extra1="https://raw.githubusercontent.com/FireWings2259/c9setup/master/addonScripts.sh"

#Check for wget
if [ ! -x /usr/bin/wget ] ; then
    # some extra check if wget is not installed at the usual place                                                                           
    command -v wget >/dev/null 2>&1 || { echo >&2 "Please install wget or set it in your path. Aborting."; exit 1; }
fi

#Get Setup Files
wget $extra1 -O /tmp/FireSetup.tmp

#Get URL for github page and download repository, if not an argument...
if [ $# -eq 0 ]; then
    echo "Enter the URL or SSH link to clone into the enviroment, then press [ENTER]:"
    read gurl
    if [[ -z "$gurl" ]]; then
       printf '%s\n' "No input entered"
       exit 1
    fi 
else
    gurl=$1
fi

wksp="$HOME/workspace/"

if [ -d $wksp ]; then
  echo Workspace is present!
else
  echo Workspace is not present!
  echo Making Workspace!
  mkdir $wksp
fi

cd $wksp
git clone $gurl || { echo >&2 "failed with $?"; exit 1; }

#Setup the workspace
gdir=$(ls -td $wksp*/ | head -1)

#echo /tmp/FireSetup.tmp > tmp

echo " " >> $HOME/.bashrc
cat /tmp/FireSetup.tmp >> $HOME/.bashrc
echo " " >> $HOME/.bashrc
echo " " >> $HOME/.bashrc
echo "cd $gdir" >> $HOME/.bashrc

rm /tmp/FireSetup.tmp
