#!/bin/bash
DB_PATH=$1

ls "$DB_PATH"
read -p "Table name: " tbl
file="$DB_PATH/$tbl"

if [ ! -f "$file" ]; then
  echo "No such table"
  exit
fi

read -p "Enter primary key value to delete: " key
#Check schema to identify PK column index
pk_index=$(head -1 "$file" | tr "|" "\n" | nl -w1 -s: | grep "pk" | cut -d: -f1)
#Checks if pk_index is empty or not (-z -> length zero )
if [ -z "$pk_index" ]; then
  echo "No primary key defined in this table"
  exit
fi

# Delete matching row(s)
tmp=$(mktemp)
head -1 "$file" > "$tmp" # keep schema
awk -F: -v k="$key" -v i="$pk_index" 'NR==1{next} $i!=k' "$file" >> "$tmp"

mv "$tmp" "$file"

echo "Row(s) deleted (if existed)"


#key = 765
#1:stu_id:int:pk
#2:name:string

#1:stu_id:int:pk
#1
#pk_index=1
#
#
# 1:stu_id:int:pk
# pk index=1

#stu_id:int:pk|name:string
#k=765  i=1

# 122:Aser
# $i = $1 = 122
# k = 765
# $1 != 765 -> true -> keep this row.
# 
# 765:Anas
# $i = $1 = 765
# k = 765
# $1 != 765 -> false -> drop this row