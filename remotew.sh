#!/bin/bash
echo $1
#GIT_AUTHOR_DATE='2017-10-01T00:01' GIT_COMMITTER_DATE='2017-10-01T00:01' git commit -m 'Graph Data 2017-10-01T00:01'

TODAY=$(date +%FT%T)

TODAY_YEAR=${TODAY:0:4}
TODAY_MONTH=${TODAY:5:2}
TODAY_DAY=${TODAY:8:2}
TODAY_HOUR=${TODAY:11:2}
TODAY_MINUTE=${TODAY:14:2}
TODAY_SECOND=${TODAY:17:2}

printf "Fecha separada : \n"
printf "YEAR = ${TODAY_YEAR}\n"
printf "MONTH = ${TODAY_MONTH}\n"
printf "DAY = ${TODAY_DAY}\n"
printf "HOUR = ${TODAY_HOUR}\n"
printf "MINUTE = ${TODAY_MINUTE}\n"
printf "SECOND = ${TODAY_SECOND}\n"
