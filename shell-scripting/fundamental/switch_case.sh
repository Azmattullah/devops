#!/bin/bash

fruit="orange"

case $fruit in 
    "apple")
    echo "It's an apple"
    ;;
    "banana")
    echo "It's a banana"
    ;;
    "orange")
    echo "It's an orange"
    ;;
    *)
    echo "Unknown fruit"
    ;;
esac