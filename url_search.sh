#!/bin/bash
#Script Name: url_search.sh
#
#
#Description: This script uses the curl function to request a webpage from the internet.
#it then scans the page for any occurence of a given word(input by the user). The number
#of occurences is the echoed to the console along with the correspond url.
#
#Input: A text file containing one URL per line and then a word/words to search for
#Ex. ./url_search.sh file.txt first_search second_search ...
#
#Output: The number of occurences of the search word is echoed to the console
#along with the corresponding url that was searched.

#loop over all the search words


#check for the existence of the inputted text file
if [ ! -e $1 ]
then
	echo the file $1 does not exist.
	exit 1
fi

#check for atleast two arguments: the .txt file and a search word
if (( "$#" < 2 ))
then
	echo Insufficient arguments. See script input directions
	exit 1
fi

for((i=2;i<=$#;i++))
do
	echo ${!i}

	var=1
#loop over all the URL's in the text file
for line in `less $1`
do
	echo -n $line
	
	#If the html file already exists, then remove it
	if [ -e $var.html ]
	then
		rm -f $var.html
	fi 
	curl -s "$line" >> $var.html

	#search the webpage for current word and count the occurences
	cat $var.html | grep "${!i}" -o | wc -l
	(( var++ ))
done
done

exit 0