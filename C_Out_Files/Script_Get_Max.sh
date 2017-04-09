#! /bin/bash

#
#	This script gets Max Stress values
#

FILE[0]="out10_copia.out"
FILE[1]="out100_copia.out"
FILE[2]="out200_copia.out"
FILE[3]="out300_copia.out"
FILE[4]="out400_copia.out"
FILE[5]="out500_copia.out"
FILE[6]="out600_copia.out"
FILE[7]="out900_copia.out"

for f in "${FILE[@]}"
do
	awk 'BEGIN{def=0;} {if ($16>def) {def = $16}} END{print def}' $f >> "PeakValues"
done
