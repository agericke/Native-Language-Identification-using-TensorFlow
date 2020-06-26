#!/bin/bash

# Definition of directories paths.
export BERT_BASE_DIR=$your_bert_directory
export BERT_DATA_DIR=$BERT_BASE_DIR/models/uncased_L-12_H-768_A-12

# Input and output Paths directories
INPUT_DIR=$BERT_BASE_DIR/bert_input_data
OUTPUT_DIR=$BERT_BASE_DIR/bert_output_data
# For every new execution, clean the output directory
rm -rf $OUTPUT_DIR
mkdir -p $OUTPUT_DIR

# For every file in the list [train, eval, test] execute BERT python script for generating
#   the feature vectors representing each text.
for i in train eval test
do
    python $BERT_BASE_DIR/extract_features.py \
           --vocab_file=$BERT_DATA_DIR/vocab.txt \
           --bert_config_file=$BERT_DATA_DIR/bert_config.json \
           --init_checkpoint=$BERT_DATA_DIR/bert_model.ckpt \
           --max_seq_length=128 \
           --batch_size=8 \
           --layers=-1 \
           --input_file=$INPUT_DIR/$i.txt \
           --output_file=$OUTPUT_DIR/$i.jsonlines
done
