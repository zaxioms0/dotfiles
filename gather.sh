#!/bin/bash
file="./locations.txt"

# This is a bad way to do this but whatev
xargs -I@ bash -c 'cp -r @ .' < $file
