#!/bin/bash


# Declaring and Using Functions:
greet() {
    w=$(whoami)
    echo "Hello $w how are you"
}

# greet 


# Function Arguments and Return Values:
print_args() {
echo "First argument: $1"
echo "Second argument: $2"
}

# print_args "Hello" "World"

calculate_sum() {
    local num1=$1
    local num2=$2
    local sum=$((num1+num2))
    echo "$sum"
    # return $sum
}

result=$(calculate_sum 13 17)
# echo "Sum: $result"


# local and global variables:

global_var="I'm global"

local_variables() {
local local_var="I'm local"
echo "Inside function: $local_var"
echo "Inside function: $global_var"
}

local_variables
echo "Outside function: $global_var"
