#!/bin/bash
DB_PATH=$1

ls "$DB_PATH"
read -p "Table name: " tbl
file="$DB_PATH/$tbl"

if [ ! -f "$file" ]; then
  echo "No such table"
  exit
fi

# Print current rows
echo "---- Current Rows ----"
cat "$file"

read -p "Enter primary key value of row to update: " key

# Read new row values (just ask for full replacement)
read -p "Enter new row (same format, separated by colons): " new_row

tmp=$(mktemp)
head -1 "$file" > "$tmp"   # keep schema 

#checks on matched row once found replaces and print rest unchanged
#NR checks on the schema line if its schmea then skip

awk -F: -v k="$key" -v new="$new_row" '
NR==1 { next } 
$1 == k { print new; next }  
{ print }
' "$file" >> "$tmp" #append to tmp file (no overwriting) 

mv "$tmp" "$file"
echo "Row updated"