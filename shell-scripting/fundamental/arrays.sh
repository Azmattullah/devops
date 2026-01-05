#!/bin/bash


# Declaring and Using Arrays

fruits=("Apple" "Mango" "Banana" "Cherry" "Orange")
# echo ${fruits[4]}


# ----- Looping Through Arrays -----

echo "Using for loop:"

for fruit in "${fruits[@]}"; do
    echo "Fruit: $fruit"
done

echo "Using while loop:"

index=0
while [ $index -lt ${#fruits[@]} ]; do
    echo "Fruit at index: ${index} ${fruits[$index]}"
    index=$((index+1))
done


# ----- Array Manipulation -----
fruits=("Apple" "Mango" "Banana")

# Adding an element
fruits+=("Greapes")

# Updating an element
fruits[0]="Stawberry"

# Removing an element
unset fruits[0]

echo "Modified Array: "
for fruit in ${fruits[@]}; do
    echo "$fruit"
done