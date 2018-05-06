#!/usr/bin/env python3

import sys
import os

input_filepath = sys.argv[1]
output_filepath = input_filepath + '-temp'

with open(output_filepath, 'w') as output_html_file:
    is_first_header = True
    for line in open(input_filepath, 'r'):
        if any(prefix in line for prefix in ['<h1', '<h2', '<h3', '<h4', '<h5', '<h6']):
            if is_first_header:
                is_first_header = False
            else:
                line = line.replace('<h1', '<h3')
                line = line.replace('/h1>', '/h3>')
                line = line.replace('<h2', '<h4')
                line = line.replace('/h2>', '/h4>')
        output_html_file.write(line)

os.rename(output_filepath, input_filepath) 
