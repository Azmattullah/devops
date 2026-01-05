#!/bin/bash


# concatenation
name1='Mohammad '
name2='Azmat'
fullname=$name1$name2
echo "I am $fullname"


# Substring Extraction
string="Hello, World!"
substring=${string:7:5} # Starting from index 7, extract 5 characters
echo "Substring: $substring"

# Searching and Replacing
string="Hello, Mohammad Azmat"
search=Hello
replace=Hi
result=${string//$search/$replace}
echo $result