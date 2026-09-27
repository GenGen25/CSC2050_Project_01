#!/bin/bash

# Check whether exactly two command-line arguments were provided.
if [ "$#" -ne 2 ]; then
	# Display the correct way to run the script.
	echo "Usage: $0 <program> <test_file>"
	# End the script with an error status.
	exit 1
fi

# Store the first command-line argument as the program name.
program="$1"

# Store the second command-line argument as the test filename.
test_file="$2"

# Check whether the program exists and is executable.
if [ ! -x "$program" ]; then
	# Display an error message if the program cannot be executed.
	echo "Error: $program does not exist or is not executable."
	# End the script with an error status.
	exit 1
fi

# Check whether the test file exists and is a regular file.
if [ ! -f "$test_file" ]; then
	# Display an error message if the test file does not exist.
	echo "Error: $test_file does not exist."
	# End the script with an error status.
	exit 1
fi

# Initialize the test number to zero.
test_number=0

# Initialize the number of passed tests to zero.
passed=0

# Initialize the number of failed tests to zero.
failed=0

# Remove comment and blank lines, count the remaining lines with awk,
# and store the number in total_tests.

total_tests=$(grep -v -e '^[[:space:]]*#' -e '^[[:space:]]*$' "$test_file" | awk 'END {printNR}')

# Read the test file after removing comment lines and blank lines.
grep -v -e '^[[:space:]]*#' -e '^[[:space:]]*$' "$test_file" |

# Read one test case at a time and store it in the variable line.
while read -r line; do
	# Use awk to get everything before the | symbol.
	# Use sed to remove spaces from the beginning and end.
	argument=$(echo "$line" | awk -F '|' '{print $1}' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

	# Use awk to get everything after the | symbol.
	# Use sed to remove spaces from the beginning and end.
	expected=$(echo "$line" | awk -F '|' '{print $2}' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
	
	# Run the program with the argument and store its output.
	actual=$("$program" "$argument")

#	---------------------------Increments Test Number---------------------------	

#will increment the test number by 1, so that it shows each test number passed
#Since its in the while loop it will iterate through it
#	NOTE:The '$((..))' is important because it will actually add the test number value stored inside
	test_number=$(($test_number + 1))

#MAKE A CONDITIONAL STATMENT: if "$actual" is connected to the... 
#	[factorial program and the agrument it passes from that program]...
#		then we set the "-eq" equal symbol to the expected value stored
if [ "$actual" -eq "$expected" ]; then

	#Need to make sure test number is incrementing thru loop
	echo "Test $test_number: PASS"

	#If it does pass it will increment
	passed=$(($passed + 1))
else
	#If test_file has 1 | 0 then it will fail
	echo "Test $test_number: FAIL"
	failed=$(($failed + 1))
fi




#	-----------------------------Prints Pass/Fail ONCE-----------------------------

#This will check the if statement where $failed and $passed is
#	and prevent it from printing it 4 times

#Since their is 4 test, if test_number reaches 4 it will excute pass and fail ONCE
if [ "$test_number" -eq "4" ]; then
	echo "Passed: $passed"
	echo "Failed: $failed"
fi

done 

