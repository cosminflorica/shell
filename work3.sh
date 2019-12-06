#!/bin/bash

cd $1
files=`ls`
let suma=0
let count=0
for i in $files
do
	if [ -k $i -a -f $i ]
	then
		#lines=`cat $i | grep "[a-z]\| \|[a-z]" `
		echo $lines
		notes=
		for j in $
		do
			let count=count+1
			let suma=suma+j
		done
	#else
	#	echo "Fisierul nu este regulat sau nu are sticky bit"
	fi
done

#echo "Suma este $suma"
