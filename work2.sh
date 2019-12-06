#/bin/bash

egrep -q -i "^$1" /etc/passwd
err=`echo $?`
#echo $err
if [[ $err == "0" ]]
then
	echo "$1 exista"
else
	echo "$1 nu exista"
fi


egrep -q -i "^$2" /etc/passwd
err=`echo $?`
#echo $err
if [[ $err == "0" ]]
then
	echo "$2 exista"
else
	echo "$2 nu exista"
fi

list1=`groups $1`
echo $list1

list2=`groups $2`
echo $list2

let ok=0

for i in $list1
do
	for j in list2
	do 
		if [[ $i == $j ]]
		then
			echo "Apartin aceluiasi grup"
		else
			ok=1
		fi
	done
done

if [[ $ok == "1" ]]
then
	echo "Nu au grupuri comune"
fi

egrep -q -i "^test:" /etc/group
err=`echo $?`
if [[ $err == "0" ]]
then 
	groupadd test

	useradd -G $1 test
	useradd -G $2 test
fi

