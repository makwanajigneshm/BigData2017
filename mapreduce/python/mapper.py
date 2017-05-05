#!/usr/bin/env python

import sys
#import the system module for standard input/output
for lines in sys.stdin:
# This will run program and read data from standard input until the program is ended with TERM signal
    lines = lines.strip()
    #Above statement removes last whitespace (newline) from the line 
    words = lines.split()
    # Split the lines into words so that we can do word cound
    for word in words:
    # loop for each word. As we are doing word count, we want to increase count of every word by 1, so the value 1 is sent out with the key as word
        print("%s\t%s")%(word,1)
        # print first value, tab, second value 

