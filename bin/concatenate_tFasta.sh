#!/bin/bash -x

## concatenate_tFasta v0.1 (20170913) Jordi Leno-Colorado
## Script to concatenate different tFasta files

## Usage: ./concatenate_tFasta.sh list_tfastas.txt outputname
## 	list_tfasta.txt: list with tFasta to concatenate (with or without path), these tFasta file could be compressed or uncompressed
##	outputname: name for the output tFasta file

list=$1
output=$2

first="yes"
for f in `cat $list`; do
    if [[ $first == "yes" ]]; then
        first="no"
        if [[ $f =~ .tfa.gz$ ]]; then
            zcat $f > $output.tfa
        elif [[ $f =~ .tfa$ ]]; then
            cat $f > $output.tfa
        else
            echo "Error: File with different extension of compressed (*.tfa.gz) or uncompressed (*.tfa) tFasta file"
            break
        fi
    else
        if [[ $f =~ .tfa.gz$ ]]; then
            zcat $f | grep -v "#" >> $output.tfa
        elif [[ $f =~ .tfa$ ]]; then
            cat $f | grep -v "#" >> $output.tfa
        else
            echo "Error: File with different extension of compressed (*.tfa.gz) or uncompressed (*.tfa) tFasta file"
            rm $output.tfa
            break
        fi
    fi
done

#gzip $output.tfa
