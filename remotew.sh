#!/bin/bash

function help() {
	printf 	"\t\tGIT REMOTE WORK - gitr v0.0.1\n
  USAGE: gitr [-h|--help] [i|init] TEXT\n
  Start working area
  	init Init date"	
}

FILENAME='gitr.log'

function init() {
	today=`date +%Y-%m-%d`
	printf "$1\n${today}" >> ${FILENAME}
}

function getRemoteDateFromFile() {
	echo $(sed -n '1p' ${FILENAME})
}

function getInitialDateFromFile() {
	echo $(sed -n '2p' ${FILENAME})	
}

function getDiffDays() {	
	echo $(( ($(date +%s) - $(date --date="$1" +%s) )/(60*60*24) ))
}

function getCommitDay() {
	# $2 => days to add, H:M:S are of your computer
	printf "$(date -d "$1+$2 days" +%F)$(date +T%T)"
}

function commit() {
	REMOTE_DATE=$(getRemoteDateFromFile)
	INIT_DATE=$(getInitialDateFromFile)
	DIFF_DAYS=$(getDiffDays ${INIT_DATE})
	COMMIT_DAY=$(getCommitDay ${REMOTE_DATE} ${DIFF_DAYS})
	printf "GIT_AUTHOR_DATE='${COMMIT_DAY}' GIT_COMMITTER_DATE='${COMMIT_DAY}' git commit -m 'Your message'\n\n\n"
}

commit

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
