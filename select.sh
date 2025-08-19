#!/bin/bash

for INPUT in $@;
do
	OPTIONS[i++]=$INPUT
done

select OPT in "${OPTIONS[@]}";
do
	if [[ -n $OPT ]];
	then
		echo $OPT
		exit 0
	fi;
done
