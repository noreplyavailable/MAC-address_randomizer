#!/bin/bash

#######################################
#																			#
#			Made by noreplyavailable				#
#				21/02/2022										#
#																			#
#######################################

printhelp () {
	echo
	echo "This is a bash script that Ioriganlly made in conjunction with the arp-scan tool."
	echo "arp-scan has some flags you can pass to spoof the source MAC/IP address when sending out ARP packages. I figured I could automate the MAC/IP-spoofing and so I did."
	echo
	echo "USAGE:"
	echo "* run ./randomac.sh and you will get a newly generated MAC address from a long list of vendors (macdonalds.txt)"
	echo "* -o to output to a file."
	echo "* -v verbose mode, show certain values."
}
#
ough=false
verbose=false
#

random () {
	local	af_array=(a b c d e f)
	local AF_array=(A B C D E F)

	local rpm=$((SRANDOM % 22))
	case $rpm in

		$(seq 0 9 | grep $rpm -ow))
			echo $rpm
			return
    	;;

		$(seq 10 15 | grep $rpm -ow))
			for t in $(($rpm - 16)); do
			  echo ${af_array[t]}
			done
			return
	    ;;

		$(seq 16 21 | grep $rpm -ow))
			for t in $(($rpm - 16)); do
			  echo ${AF_array[t]}
			done
			return
	    ;;

	  *)
	    echo "BIG FAT ERROR"
	    ;;
	esac
}


startscan () {
	echo "" > newmac
	for c in $(seq 0 2)
		do
		for d in 0
			do
			echo ":" >> newmac
			done
		for b in $(seq 0 1)
			do
			random >> newmac
			done
		done

	(readarray -t ARRAY < newmac; IFS=''; echo "${ARRAY[*]}" >> newmac)

	local rng=$(shuf -i 0-19010 -n1)
	local macintosh=$(cat newmac -b | grep 10)
	local source=$(cat macdonalds.txt | grep $rng -wi)


	echo "" > newmac

	if [[ $rng -lt 1000 ]] && [[ $rng -gt 99 ]]
	then
		source=$(cat macdonalds.txt | grep "0$rng" -wi)
		echo $source
		echo "${source:7:8}" > newmac
	elif [[ $rng -lt 100 ]] && [[ $rng -gt 9  ]]
	then
		source=$(cat macdonalds.txt | grep "00$rng" -wi)
		echo $source
		echo "${source:7:8}" > newmac
	elif [[ $rng -lt 10 ]] && [[ $rng -ge 0  ]]
		then
		source=$(cat macdonalds.txt | grep "000$rng" -wi)
		echo $source
		echo "${source:7:8}" > newmac
	elif [[ $rng -lt 10000 ]] && [[ $rng -gt 999 ]]
	then
		echo ${source:6:8} > newmac
	else
		echo ${source:8:8} > newmac
	fi

if [[ $verbose == true  ]]; then
		echo "Random manufacturer: "$source
		printf "Generated mac address: "${macintosh:7:9}"\n"
		echo "RNG: $rng"
		echo
fi

	echo ${macintosh:7:9} >> newmac
	(readarray -t ARRAY < newmac; IFS=''; echo "${ARRAY[*]}" >> newmac)
	happymeal=$(tail newmac -n +3)

	output=$(echo $(cat newmac))
	if [[ $ough == true  ]]; then
		echo $output | cut -d " " -f3 > newmac
	else
		rm newmac
	fi

	echo $output | cut -d " " -f3


}
#Dont forget to change ":hy" if youw ant more options, stupid.
while getopts ":h:o:v" option; do
	case $option in
		o)
			ough=true
			startscan
			exit;;
		v)
			verbose=true
			startscan
			exit;;
		:)
			printhelp
			exit;;
		\?)
			echo $option
			echo "BIG FAT OPTION ERROR"
			exit;;	
	esac
done

if [[ $option == ? ]]
then
	startscan
fi


