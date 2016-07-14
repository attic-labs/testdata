
https://data.sfgov.org/api/views/yitu-d5am/rows.csv?accessType=DOWNLOAD

* No primary key (import as list, the default)
* Column types: "String,Number,String,String,String,String,String,String,String,String,String"
* Current data has a wonky extra header, so we use custom header line and skip the first row

csv-import -header=Title,ReleaseYear,Locations,FunFacts,ProductionCompany,Distributor,Director,Writer,Actor1,Actor2,Actor3 -column-types=String,Number,String,String,String,String,String,String,String,String,String -skip-records=1
