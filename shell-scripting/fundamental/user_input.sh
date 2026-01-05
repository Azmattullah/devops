#!/bin/bash


# Reading User Input

echo "Please Enter your name"
read name
echo "Hello, $name Nice to meet you."
printf "Hello, $name Nice to meet you."


# Inoute with prompting

read -t 5 -s -p "what is favorite fruit: " fruit
echo "Your faviroute fruit is $fruit"