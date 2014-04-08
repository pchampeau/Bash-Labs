#!/bin/bash                                                                                                                                                                                                       
#Script Name: birthday_match.sh                                                                                                                                                                                   
#                                                                                                                                                                                                                 
#Description: This script matches two birthdays(MM/DD/YYYY) to their corresponding specific days                                                                                                                  
# of the week and then tells the user if the two birthdays were on the same day of the week.                                                                                                                      
#                                                                                                                                                                                                                 
#Input: Two dates in the format MM/DD/YYYY MM/DD/YYYY                                                                                                                                                             
#                                                                                                                                                                                                                 
#                                                                                                                                                                                                                 
#Output: Prints the results of the birthday match to the console                                                                                                                                                  
#                                                                                                                                                                                                                 
#                                                                                                                                                                                                                  

if [ $3 ]
then
    echo INVALID ARGUMENT: birthday_match accepts two arguments formatted as {MM/DD/YYYY MM/DD/YYYY}
    exit 1
fi

if [ $1 ] && [ $2 ]
then
    if  echo $1 | grep -q ../../....  && echo $2 | grep -q ../../....
        then
    day1=`date -d $1 | cut -d' ' -f1`
    day2=`date -d $2 | cut -d' ' -f1`
    if [ "$day1" == "$day2" ]
        then
        echo The first person was born on: $day1
        echo The second person was born on: $day2
        echo Jackpot! You were both born on the same day of the week!
        exit 0
        else
        echo The first person was born on: $day1
        echo The second person was born on: $day2
        echo Therefore, you are not born on the same day of the week.
        exit 0
        fi
    else
        echo INVALID ARGUMENT: birthday_match accepts two arguments formatted as {MM/DD/YYYY MM/DD/YYYY}
    fi
else
    echo INVALID ARGUMENT: birthday_match accepts two arguments formatted as {MM/DD/YYYY MM/DD/YYYY}
    exit 1
fi