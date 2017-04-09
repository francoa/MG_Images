#! /bin/bash

#
#	This script allows to get the von Mises stress for a certain value of Strain
#	EXAMPLE: bash Script_Get_Stress4Deformation.sh 0.12
#

FILE[0]="out10_copia.out"
FILE[1]="out100_copia.out"
FILE[2]="out200_copia.out"
FILE[3]="out300_copia.out"
FILE[4]="out400_copia.out"
FILE[5]="out500_copia.out"
FILE[6]="out600_copia.out"
FILE[7]="out900_copia.out"

for i in `seq 0 7`
do
	INIT[i]=$(awk 'FNR == 1 {print $15}' ${FILE[i]})
done

let INDEX=0
for f in "${FILE[@]}"
do
	awk 'BEGIN{def='${INIT[$INDEX]}';} {if ('$1'<=(def-$15)/def && $15!="") {print $16; exit 0}} END{}' $f >> "StressValues"
	let INDEX=$INDEX+1
done
