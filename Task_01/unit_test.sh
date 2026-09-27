#!/bin/bash

#having a bash script that accpets excutable name "./factorial"
#	accepts one agrument "5"
#	accepts one expected output

# if is the conditional
# $# is the number out of these files --> $1, $2, $3
# -ne mena s"not equal to" for intergers
# 2 is expected number of agruments
#	PASS      or 	FAIL

if [ $# -ne 3 ]; then
	echo "Usage: write program -> ./factorial, write -> # and expected -> # "
	exit 1
fi

# program will grab the factorial.c file
program="$1"

# Print the num for factorial function
number="$2"

# What is the expected number
answer="$3"



# if statement, ! = not, "-f" checks if its a regular file, 
# "$test_file" is the value stored in the variable named 'test_file'
#if [ ! -f "$test_file" ]; then
#	echo "Error: $test_file does not exist"
#	exit 1
#fi
	

# if "$program" is not equal (!=) to a c file
#if [[ "$program" != *.c ]]; then
#	echo "Use a c file homie!"
#	exit 1
#fi



# if the stored variable "$program" is does not have executable persmission
if [ ! -x "$program" ]; then
	echo "Error: $program does not exist or is not executable."
	exit 1
fi

# Access program to make sure its correct, and save output 
check_program=$("$program" "$number")

# Accessing the program will =(-eq) the answer to check if its correct
if [ "$check_program" -eq "$answer" ]; then
	echo "PASS!"
else
	echo "FAIL"
	echo "EXPECTED: $answer"
	echo "Got: $check_program"
fi
