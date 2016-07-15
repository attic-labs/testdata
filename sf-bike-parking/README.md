
https://data.sfgov.org/api/views/2e7e-i7me/rows.csv?accessType=DOWNLOAD

Primary key: field 2
Column types: "Number,Number,Number,String,String,String,String,Number,Number,String,String"

# import direct from file->map
csv-import -dest-type map:2 -column-types "Number,Number,Number,String,String,String,String,Number,Number,String,String" http://localhost:8000::sf-bicycle-parking 2016-06-03.csv

# import file->blob->map (the way demo.noms.io does)
../../demo-server/scripts/import_csv.py --csv_args='-dest-type map:12 -column-types Number,String,String,String,String,String,String,String,String,Number,Number,String,Number' 2016-06-08.csv http://localhost:8081 sf-crime

# import the entire dir as above
ls *.csv | xargs -I{} ../../demo-server/scripts/import_csv.py --csv_args='-dest-type map:12 -column-types Number,String,String,String,String,String,String,String,String,Number,Number,String,Number' {} http://localhost:8081 sf-crime
