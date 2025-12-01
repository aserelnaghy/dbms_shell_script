#!/bin/bash
DB_PATH=$1

echo "----------------"
echo "Existing tables"
echo "----------------"
ls "$DB_PATH"
read -p "Table name: " tbl
file="$DB_PATH/$tbl"

if [ ! -f "$file" ]; then
  echo "No such table"
  exit
fi

echo "==== Table: $tbl ===="
# header row in schema
# head -1 "$file" | tr "|" "\t"
echo "--------------"
echo "ID   Name"
echo "--------------"
#start from line 2 till end and format into aligned columns using ":" as separator
tail -n +2 "$file" | column -t -s:
echo "/////////////////////////////"