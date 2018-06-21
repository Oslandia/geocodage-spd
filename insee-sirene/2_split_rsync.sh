#! /bin/bash

echo $1
mkdir -p communes

# entête des fichiers CSV par commune
for i in `csvcut -c 25,28 $1 | sort -u | sed 's/,//' | grep '^[0-9]'`; do
  head -n 1 geo-sirene_01.csv > communes/$i.csv;
done

# split des fichiers
tail -n +2 $1 | awk -v FPAT='[^,]*|"([^"]|"")*"' '{print >> "communes/"$25$28".csv"}'
