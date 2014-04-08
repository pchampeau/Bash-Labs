#!/bin/bash
#Script Name: count_files.sh
#
#
#Description: This script counts the number of files in current directory and sub directories
#grouping them by file type(.pdf, .doc, .jpeg, ...) If a file has no extension then it is 
#put into the category "noext". 
#
#Input: None
#
#Output: The file types and corresponding numbers are output to the console
#
#

#this counts all the files witout an extension
#find all the files that do not match the pattern "*.*" or "."(the current directory)
#but include those that match "*." and then count them up
no_extension=`find . -type f -not -name "." ! name "*.*" -o -name "*." | wc -l`

#this finds/ sums/ and sorts all the file with extensions
#Find files that match the pattern "*.*" but exlcuding those that end in
#"*.", then cut off the extension, sort, and count them up
find . -type f -not -name '*.' -name "*.*" | rev | cut -d'.' -f1 \
| rev | sort | uniq -c | sort -k1 -rn

#Lastly print out the number of "noext" files

echo "  " $no_extension noext

exit 0

