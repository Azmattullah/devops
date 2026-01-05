#!/bin/bash


# for Loop:

# for color in red green blue white orange; do
#     echo "Color: $color"
# done



# while Loop

# read -p "Please enter the number which table you want " num

# count=1
# while [ $count -le 10 ]; do
#     # echo "$num X $count =" $(($num*$count))
#     echo "Count: $count"
#     ((count++))
# done


# Unit Loop

num=0 
until [ $num -ge 5 ]; do
    echo "Number: $num"
    ((num++))
done