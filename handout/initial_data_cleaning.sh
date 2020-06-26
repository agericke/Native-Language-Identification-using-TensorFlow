#!/bin/bash

# Set-up directories.
export BASE_DIR=$HOME/cs585/homework/hw4
# Data directory where we can find the datafiles needed for re-format
export DATA_DIR=$BASE_DIR/handout/data
# Data directory where we will find save the cleaned files.
export BERT_DIR=$BASE_DIR/bert

# For every document of the list [eval, train, test] re-format each document.
for i in eval train test
do
    # Output each file content, pick only column 2 data that represents the text itself,
    #   erase the first line that are headings and save the output to each document in the 
    #   output directory.
    cat $DATA_DIR/lang_id_$i.csv  | cut -d ',' -f 2 | sed 1d > $BERT_DIR/bert_input_data/$i.txt
done