#! /bin/bash

#
#	This script gets Max Stress values
#

FILE[0]="PBoundaries_10K.dat"
FILE[1]="PBoundaries_100K.dat"
FILE[2]="PBoundaries_200K.dat"
FILE[3]="PBoundaries_300K.dat"
FILE[4]="PBoundaries_400K.dat"
FILE[5]="PBoundaries_500K.dat"
FILE[6]="PBoundaries_600K.dat"
FILE[7]="PBoundaries_900K.dat"

for f in "${FILE[@]}"
do
	awk 'BEGIN{def=0;} {if ($16>def) {def = $16}} END{print def}' $f >> "PeakValues"
done
