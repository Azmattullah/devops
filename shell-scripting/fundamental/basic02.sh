#!/bin/bash


# Command Substitution: You can capture the output of a command and assign it to a variable using command substitution. There are two ways to do this:


# Using Backticks:
current_date=`date +%H-%M-%S`
echo "Current date: $current_date"


#Using $(...):
current_time=$(date +%H-%M-%S)
echo "Current time: $current_time"


# Readonly Variables:
readonly pi=3.14159
# pi=3.14
echo $pi


# Unsetting Variables:
unset variable_name


echo '------------------------------------'


# Quoting Variables: Quoting variables properly is essential to preserve spaces and special characters:
variable="Hello World"
echo "Using double quotes: $variable"
echo 'Using single quotes: $variable'
echo Using no quotes: $variable
echo "Using double quotes: '$variable'"



# Escaping Characters: If you need to include special characters within a variable, you can escape them using backslashes:
special_char="\-"
echo "Variable: $special_char"

