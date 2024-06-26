#!/bin/bash

function display_menu() {
    echo "1. Check memory processes"
    echo "2. Check PID"
    echo "3. Exit"
}

function mem() {
    ps aux
    echo "Option 1 to kill any process option 2 to back to menu"
    read -r choice
    case $choice in
        1)
            echo "Enter PID to kill : "
            read r
            sudo kill $r
            ;;
        2)
            return
            ;;
    esac
}

function pid() {
    echo "Enter username: "
    read username
    ps -u "$username" -o pid,ppid,%cpu,%mem,cmd
}

while true; do
    display_menu
    read -r choice

    case $choice in
        1)
            mem
            ;;
        2)
            pid
            ;;
        3)
            echo "Exiting program."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
