#!/bin/bash
NUMBER=$1

if [ $((NUMBER%2)) -eq 0 ]
then
   echo "Number is even"
else
   echo "Number is odd"
fi

#if [ $((NUMBER%2)) -eq 0 ]
#then
 #   echo "Given number $NUMBER even"
#else
 #   echo "Given number $NUMBER odd"
#fi