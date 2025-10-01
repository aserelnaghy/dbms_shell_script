#!/bin/bash
DB_ROOT="./databases"
mkdir -p "$DB_ROOT"

while true; do
    echo "=== Main Menu ==="
    echo "1) Create Database"
    echo "2) List Databases"
    echo "3) Connect to Database"
    echo "4) Drop Database"
    echo "5) Exit"
    read -p "Choose: " choice

    case $choice in
        1) read -p "Enter database name: " db; mkdir "$DB_ROOT/$db" || echo "Already exists";;
        2) ls "$DB_ROOT" || echo "No databases found";;
        3) ls "$DB_ROOT"; read -p "Enter database name to connect: " db; [ -d "DB_ROOT/$db" ] && ./table_menu.sh "$DB_ROOT/$db" || echo "Database not found";;
        4) read -p "Enter database name to delete: " db; rm -r "$DB_ROOT/$db" || echo "Database not found";;
        5) exit;;
        *) echo "Invalid option";;
    esac
done