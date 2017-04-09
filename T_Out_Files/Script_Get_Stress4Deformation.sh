#! /bin/bash

#
#	This script allows to get the von Mises stress for a certain value of Strain
#	EXAMPLE: bash Script_Get_Stress4Deformation.sh 0.12
#

FILE[0]="PBoundaries_10K.dat"
FILE[1]="PBoundaries_100K.dat"
FILE[2]="PBoundaries_200K.dat"
FILE[3]="PBoundaries_300K.dat"
FILE[4]="PBoundaries_400K.dat"
FILE[5]="PBoundaries_500K.dat"
FILE[6]="PBoundaries_600K.dat"
FILE[7]="PBoundaries_900K.dat"

for i in `seq 0 7`
do
	INIT[i]=$(awk 'FNR == 1 {print $15}' ${FILE[i]})
done

let INDEX=0
for f in "${FILE[@]}"
do
	awk 'BEGIN{def='${INIT[$INDEX]}';} {if ('$1'<=(-def+$15)/def && $15!="") {print $16; exit 0}} END{}' $f >> "StressValues"
	let INDEX=$INDEX+1
done
