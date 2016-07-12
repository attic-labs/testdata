
https://data.sfgov.org/api/views/tmnf-yvry/rows.csv?accessType=DOWNLOAD

Primary key: field 12
Column types: "Number,String,String,String,String,String,String,String,String,Number,Number,String,Number"

csv-import -dest-type map:12 -column-types "Number,String,String,String,String,String,String,String,String,Number,Number,String,Number" http://localhost:8000::sfcrime ~/Downloads/sfcrime/2015-09-03.csv

