#!/bin/sh

FILE_NAME="SFPD-Incidents-from-1-January-2003.csv"

if [ -f $FILE_NAME ] ; then
	mv $FILE_NAME $FILE_NAME.bak
fi

echo Downloading...
curl -o $FILE_NAME.x https://data.sfgov.org/api/views/tmnf-yvry/rows.csv?accessType=DOWNLOAD

HEADER_ROW=`head -n1 $FILE_NAME.x`

echo 'Sorting...'
# echo header row, then the sorted output of the remaining lines
{ echo $HEADER_ROW; sed '1d' $FILE_NAME.x | sort ; } > $FILE_NAME

rm -rf $FILE_NAME.x

echo 'Compressing...'
gzip -9 $FILE_NAME

echo done.
