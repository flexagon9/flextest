#!/bin/bash 
SERVER_CONFIG_PATH=/home/oracle/server.config
function getAttribute() {
    echo `grep ^${HOSTNAME}.$1.$2 ${SERVER_CONFIG_PATH} | cut -f2 -d'='`
}
           
OLD_PATH=${PATH}

DATABASES=`grep ${HOSTNAME} ${SERVER_CONFIG_PATH} | cut -f2 -d'.' | sort | uniq`
ORAENV_ASK=NO
for DATABASE in ${DATABASES}
do
  if [[ $(grep ^${HOSTNAME}.${DATABASE}. ${SERVER_CONFIG_PATH} | wc -l) != 2 ]]; then
    BADOUTPUT+="${HOSTNAME}.${DATABASE} in server.config had bad data. Please check the file. The other databases will still try to start if needed."
    BADOUTPUT+="There should be 2 lines per database."
    BADOUTPUT+=`grep ${HOSTNAME}.${DATABASE} ${SERVER_CONFIG_PATH}`
  else
    export ORACLE_SID=`getAttribute ${DATABASE} sid`
    LISTENER=`getAttribute ${DATABASE} listener`
    . oraenv
    ERROR=0
    if [[ -z ${ORACLE_SID} ]]; then
      ERROR=1
      BADOUTPUT+="${HOSTNAME}.${DATABASE}.sid in server.config was missing. Please check the file. The other databases will still try to start if needed."
    fi
    if [[ -z ${LISTENER} ]]; then
      ERROR=1
      BADOUTPUT+="${HOSTNAME}.${DATABASE}.listener in server.config was missing. Please check the file. The other databases will still try to start if needed."
    fi    
    
    if [[ ${ERROR} = 0 ]]; then
      if [[ $(ps -ef | grep mon_${ORACLE_SID} | wc -l) = 1 ]];  then
        sqlplus '/ as sysdba' @/home/oracle/startup.sql
        
        GOODOUTPUT+="Started database ${ORACLE_SID}."
      else
        echo "Nothing to do here. Database ${ORACLE_SID} is already running."
      fi
      if [[ $(ps -ef | grep 'tnslsnr '${LISTENER}' ' | wc -l) = 1 ]];  then
        lsnrctl start ${LISTENER}
        GOODOUTPUT+="Started listener ${LISTENER}."
      else
        echo "Nothing to do here. Listener ${LISTENER} is already running."
      fi
    fi
  fi
done


export PATH=${OLD_PATH}

if [[ ${BADOUTPUT} ]]; then
  BADOUTPUT="Running on Server ${HOSTNAME}.${BADOUTPUT}"
  echo "$BADOUTPUT" | mailx -s "Error starting Databases" karl.henselin@flexagon.com
fi

if [[ ${GOODOUTPUT} ]]; then
  GOODOUTPUT="Running on Server ${HOSTNAME}.${GOODOUTPUT}"
  echo "$GOODOUTPUT" | mailx -s "Started Databases: " karl.henselin@flexagon.com
fi
ORAENV_ASK=YES