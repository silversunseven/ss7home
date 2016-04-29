#!/bin/bash 

SUBFILE=`echo ${1} | tr ' ' '_'`
mv "${1}" ${SUBFILE}

BW_FILE='./.badwords'
NEW_SUB_FILE="${SUBFILE}_mormonized.srt"
PRE_WARN_TIME_SECS='2'
FILETYPE=`file ${SUBFILE}`
CNT='0'
LOG='cleansub.log'

if [[ "${FILETYPE}" =~ "CRLF" ]]
then
    echo "Converting from DOS format"
    cat ${SUBFILE} | col -b > ${SUBFILE}_2
    mv ${SUBFILE}_2 ${SUBFILE}
elif [[ ${FILETYPE} =~ "ASCII" ]]
then
    echo "Subtitle is of unix format"
fi

grep -i "font color" ${SUBFILE} > /dev/null
if [ $? -eq '0' ]
then
    echo "Contains 'Font Color' flags, cleaning up file"
    cat ${SUBFILE} |sed 's/<i>//g' | sed 's/<\/i>//g' | sed 's/<font.*font>//g' > ${SUBFILE}_2
    mv ${SUBFILE}_2 ${SUBFILE}
fi

cat /dev/null > ${NEW_SUB_FILE}
cat ${SUBFILE} |tr '[:upper:]' '[:lower:]' > ${SUBFILE}_2
mv ${SUBFILE}_2 ${SUBFILE}
cat ${BW_FILE}  |tr '[:upper:]' '[:lower:]' > ${BW_FILE}_2
mv ${BW_FILE}_2 ${BW_FILE}
 
IFS=$'\n'
typeset -a title
for line in $(< ${SUBFILE})
do
    [[ "$line" =~ ^$ ]] && continue
    [[ "$line" =~ ^[0-9]+$ ]] && n=$line
    title[n]="${title[n]}${line}|"
done
 
IFS='|'
 
TotalElementNum=`echo ${#title[@]}`
key='1'
new_key='1'
while [ ${key} -lt ${TotalElementNum} ]
do
  read -a wtitle <<< "${title[${key}]}"
  ID=`echo -e "${wtitle[0]}\n"`
  TIME=`echo -e "${wtitle[1]}\n"`
  END_TIME=`echo -e "${wtitle[1]}\n" | cut -d'>' -f2`
  TXT=`echo -e "${wtitle[2]} ${wtitle[3]} ${wtitle[4]}\n"`
  #DEBUG# echo "START : $ID $TIME $TXT :END"
  IFS=$'\n'
  for BW in `cat ${BW_FILE}`
  do
    if [[ "$TXT" =~ ${BW} ]]
    then
      CNT=$(( ${CNT} - 1 ))
      PREV_KEY=$(( ${key} - 1 ))
      echo "${new_key}" >> ${NEW_SUB_FILE}
      PREV_ELEMENT=`echo ${title[${PREV_KEY}]}`
      FULL_PREV_TIME_ORIG=`echo ${PREV_ELEMENT} | cut -d'|' -f2`
      PREV_TIME_FIRST_ORIG=`echo ${FULL_PREV_TIME_ORIG} | cut -d' ' -f1`
      PREV_TIME_REST=`echo ${FULL_PREV_TIME_ORIG} | cut -d' ' -f2-`
      PREV_TIME_ORIGSEC=`echo ${PREV_TIME_FIRST_ORIG} | cut -d':' -f3 | cut -d',' -f1`
      if [ "${PREV_TIME_ORIGSEC}" -gt ${PRE_WARN_TIME_SECS} ]
      then 
	PREV_TIME_NEWSEC_RAW=`echo "${PREV_TIME_ORIGSEC} - ${PRE_WARN_TIME_SECS}" | bc`
      	PREV_TIME_NEWSEC=`printf "%02i\n" $PREV_TIME_NEWSEC_RAW`
      	PREV_TIME_FIRST_NEW=`echo ${PREV_TIME_FIRST_ORIG} | sed "s/${PREV_TIME_ORIGSEC}/${PREV_TIME_NEWSEC}/g"`
      	FULL_PREV_TIME_NEW=`echo ${PREV_TIME_FIRST_NEW} ${PREV_TIME_REST}`
      else 
	FULL_PREV_TIME_NEW=${FULL_PREV_TIME_ORIG}
      fi
 
      echo "${FULL_PREV_TIME_NEW}" >> ${NEW_SUB_FILE}
      echo "************ - GOTO ${END_TIME}" >> ${NEW_SUB_FILE}
      echo '' >> ${NEW_SUB_FILE}
      new_key=$(( ${new_key} + 1 ))
      echo "${key} contains ${BW}"
    fi
  done
  IFS='|'
  key=$(( ${key} + 1 ))
done
echo "${CNT} entries found - ${NEW_SUB_FILE}" | tee -a ${LOG} 
IFS=$' \t\n'
 
