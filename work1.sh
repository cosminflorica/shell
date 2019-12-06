#!/bin/bash

select ITEM in "File" "User" "Exit"
do
case $REPLY in

	1)
	read fis

	Type=`stat -c %F $fis`
	HardLinks=`stat -c %h $fis`
	GroupOwner=`stat -c %G $fis`
	Inode=`stat -c %i $fis`
	WriteRight=`stat -c %A $fis | cut -c3`
	echo $Type
	echo $HardLinks
	echo $GroupOwner
	echo $Inode
	if [ "$WriteRight" == "w" ]

	then
		echo "Owner are drept de scriere"
	else
		echo "Owner nu are drept de scriere"
	fi
	;;
	
	2)
	#Path=$1
	FileName=`basename $1`
	echo $FileName
	
	Test=`echo $Filename | egrep "[aeiou]"`
	
	echo $Test

	errCode=`echo $?`

	echo "eroarea este $errCode"

	if [[ "$errCode" == "0" ]]
	then 

		Backup="backup-`whoami`"
		#echo $Backup
		find -name $Backup
		errCode=`echo $?`
		echo $errCode

		if [[ "$errCode" == "0" ]]
		then
			#echo $Path
			echo $Path >> $Backup
		else
			echo "Backup deja existent"
		fi	

	fi
	;;	


	3)
	exit 1
esac
done
