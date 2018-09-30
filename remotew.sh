#!/bin/bash
#GIT_AUTHOR_DATE='2017-10-01T00:01' GIT_COMMITTER_DATE='2017-10-01T00:01' git commit -m 'Graph Data 2017-10-01T00:01'

FILENAME='gitr.log'

function getYear(){
  echo ${1:0:4}
}

function getMonth(){
  echo ${1:5:2}
}

function getDay(){
  echo ${1:8:2}
}

function getHour(){
  echo ${1:11:2}
}

function getMinute(){
  echo ${1:14:2}
}

function getSecond(){
  echo ${1:17:2}
}

function help() {
	printf 	"\t\tGIT REMOTE WORK - gitr v0.0.1\n
  USAGE: gitr [-h|--help] [i|init] TEXT\n
  Start working area
  	init Init date"	
}

function init() {
	today=`date +%Y-%m-%d`
	printf "$1\n${today}" >> ${FILENAME}
}

TODAY=$(date +%FT%T)
TODAY_YEAR=$(getYear $TODAY)
TODAY_MONTH=$(getMonth $TODAY)
TODAY_DAY=$(getDay $TODAY)
TODAY_HOUR=$(getHour $TODAY)
TODAY_MINUTE=$(getMinute $TODAY)
TODAY_SECOND=$(getSecond $TODAY)

printf "YEAR = ${TODAY_YEAR}\n"
printf "MONTH = ${TODAY_MONTH}\n"
printf "DAY = ${TODAY_DAY}\n"
printf "HOUR = ${TODAY_HOUR}\n"
printf "MINUTE = ${TODAY_MINUTE}\n"
printf "SECOND = ${TODAY_SECOND}\n"


# __main__
if [[ -n $1 ]]; then
	case $1 in
		'-h' | '--help' )
			help
			;;

		'i' | 'init' )
			init $2
			;;
		* )
			printf "No valid argument"
			;;
	esac
else
	printf "No aguments"
fi
