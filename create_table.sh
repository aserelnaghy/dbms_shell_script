#!/bin/bash
DB_PATH=$1

read -p "Table name: " tbl

if [ -f "$DB_PATH/$tbl" ]; then
	echo "Table Already Exists"
	exit
fi

read -p "Number of columns: " n
schema=""

for ((i=1; i<=n; i++ )); do
	read -p "Column $i name: " col
	read -p "Datatype (int/string): " type
	read -p "Primary key? (y/n): " pk
	if [ "$pk" = "y" ]; then
		schema+="$col:$type:pk|"
	else
		schema+="$col:$type|"
	fi
done

schema=${schema%|}
echo "$schema" > "$DB_PATH/$tbl"

