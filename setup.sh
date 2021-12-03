#!/bin/bash
#---------- init ----------
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"; SOURCE="$(readlink "$SOURCE")"; [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"; done
SCRIPTDIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null && pwd )"
cd $SCRIPTDIR
#---------- /init ----------
#----------  functions  ---------
readonly RESET="\e[0m"                    # Remove all atributes
readonly NOCOLOR="\e[39m"                 # Default foreground color 
readonly BLACK="\e[30m"                   # Black
readonly DRED="\e[31m"                    # Red
readonly DGREEN="\e[32m"                  # Green
readonly ORANGE="\e[33m"                  # Yellow
readonly BLUE="\e[34m"                    # Blue
readonly VIOLET="\e[35m"                  # Magenta
readonly CYAN="\e[36m"                    # Cyan
readonly LGRAY="\e[37m"                   # Light gray  
readonly DGRAY="\e[90m"                   # Dark gray 
readonly RED="\e[91m"                     # Light red 
readonly GREEN="\e[92m"                   # Light green  
readonly YELLOW="\e[93m"                  # Light yellow  
readonly DBLUE="\e[94m"                   # Light blue
readonly PINK="\e[95m"                    # Light magenta
readonly LBLUE="\e[96m"                   # Light cyan
readonly WHITE="\e[97m"                   # White
COLORX() { echo "\e[38;5;$1m" ;}          # color 1 - 256
myname=$(basename -s .sh $0)
startdate=$(date +%F_%H-%M-%S_%N)
echoz() { echo -e "\e[90m"$(date +%s%N) "\e[94m" $myname : "\e[39m" "$@" 1>&2 ;}
zighello() {
  fillspaces=$(expr 21 - "${#myname}"); if [ $fillspaces -lt 0 ]; then fillspaces=0;fi
  echo -e  $BLUE"\e(0\x6c\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x7\x6b\e(B\e[39m"
  echo -en $BLUE"\e(0\x78\e(B        \e[34m==\e[35m==\e[91m==\e[93m==\e[92m==\e[96m== \e[39m Hello! My name is \e[33m$myname \e[96m==\e[92m==\e[93m==\e[91m==\e[35m==\e[34m=="
  while [ $fillspaces -gt 0 ]; do echo -n " "; let fillspaces=$fillspaces-1; done
  echo -e  $BLUE"    \e(0\x78\e(B"
  echo -e  $BLUE"\e(0\x78\e(B\e[90m    Writen By: $(COLORX 99)Zigfi \e[90mStarted run: \e[93m $startdate              \e[34m\e(0\x78\e(B\e[39m"
  echo -e  $BLUE"\e(0\x78\e(B                                                                              \e[34m\e(0\x78\e(B\e[39m"
  echo -e  $BLUE"\e(0\x6d\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x71\x7\x6a\e(B\e[39m"
  echo -e $NOCOLOR
}
#---------- /functions ----------
zighello
#---------- start ----------
python3 -m venv local_env
source local_env/bin/activate