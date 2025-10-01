#!/bin/bash
DB_PATH=$1

while true; do
    echo "==== Tables Menu [$(basename $DB_PATH)] ===="
    echo "1) Create Table"
    echo "2) List Tables"
    echo "3) Drop Table"
    echo "4) Insert into Table"
    echo "5) Select From Table"
    echo "6) Delete From Table"
    echo "7) Update Table"
    echo "8) Back"
    read -p "Choose: " choice

    case $choice in
        1) ./create_table.sh "$DB_PATH";;
        2) ls "DB_PATH";;
        3) ls "DB_PATH"; read -p "Enter table name to remove: " tbl; rm "$DB_PATH/$tbl";;
        4) ./inser.sh "$DB_PATH";;
        5) ./select.sh "$DB_PATH";;
        6) ./delete.sh "$DB_PATH";;
        7) ./update.sh "$DB_PATH";;
        8) break;;
        *) echo "Invalid option";;
    esac
done