#!/bin/bash

Movielist=("Pushpa" "Court" "Zee" "TV9" "NTV")

echo "First movie from the list: ${Movielist[0]}"
echo "Secound Movie From the list: ${Movielist[1]}"
echo "Therad Movie From the list: ${Movielist[2]}"
echo "Fourth Movie From the list: ${Movielist[3]}"
echo "Five Movie From the list: ${Movielist[4]}"

echo "Total Number of movies: $#"
echo "Movies Info: ${Movielist[@]}"

echo "PID of movies: $!"