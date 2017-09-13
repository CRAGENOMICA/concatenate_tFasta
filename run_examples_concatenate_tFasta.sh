## concatenate_tFasta v0.1 (20170913) Jordi Leno-Colorado
## Script to concatenate different tFasta files

## Usage: ./concatenate_tFasta.sh list_tfastas.txt outputname

cd ./Examples

# Run examples

echo -----------------------------------------------------------------------
echo Example 1. Concatenate 3 tFasta files, each tFasta with one chromosome
echo -----------------------------------------------------------------------
echo
echo ../bin/concatenate_tFasta.sh list_tfasta.txt example_merged
../bin/concatenate_tFasta.sh list_tfasta.txt example_merged
echo
