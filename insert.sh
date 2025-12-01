#!/bin/bash
DB_PATH=$1

ls "$DB_PATH"
read -p "Table name to insert into: " tbl
file="$DB_PATH/$tbl"

if [ ! -f "$file" ]; then
	echo "Table not found"
	exit
fi

IFS="|" read -ra cols <<< "$(head -1 "$file")"
row=""
for col in "${cols[@]}"; do
  name = $(echo $col | cut -d: -f1)
  type = $(echo $col | cut -d: -f2)
  pk   = $(echo $col | cut -d: -f3)

   while true; do
	read -p "Enter $name ($type): " val
	if [ $type = "int" ] && ! [[ "$val" +~ ^[0-9]+$ ]]; then
	   echo "Must be integer"; continue
	fi
	if [ "$pk" = "pk" ]; then
	   if cut -d: f1 "$file" | grep -qx "$val"; then
	     echo "Primary key already exists"; continue
	   fi
	fi
	break
    done
    row+="val:"
done

row=${row%:}
echo "$row" >> "$file"
