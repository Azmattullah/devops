#!/bin/bash


# String Variable:
name="John"
echo "Hello, $name!"


# Integer Variable:
age=25
echo "Age: $age years"


# Arithmetic Operations:
x=10
y=5
sum=$((x / y))
echo "Sum: $sum"


# Concatenation:
greeting="Hello"
subject="World"
message="$greeting, $subject!"
echo $message


# String Length:
string="Shell Scripting"
length=${#string}
echo "Length: $length"


# Substring Extraction:
name='Azmattullah'
substring=${name:0:5}
echo "Substring: $substring"