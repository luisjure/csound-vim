#!/bin/bash
# generates a list of opcodes form the command "csound -z"
# this file is part of csound-vim
# https://github.com/luisjure/csound-vim
# Last Change:	2020-02-17

OUTFILE="./syntax/mycsound_opcodes"

# exit if Csound not found
type csound >/dev/null 2>&1 || {
	echo >&2 "Csound not found. Nothing to do."
	exit 1
	}

# check Csound version
CSOUNDVERSION=`csound -z 2>&1 | grep Csound | sed 's/--//'`

# check if $OUTFILE exists

if [[ -f $OUTFILE ]] ; then
	echo "The file $OUTFILE already exists"
	echo "for `grep Csound $OUTFILE | sed 's/" //'`"
	echo "Do you want to overwrite it? (y/n)"

	PROCCEED=""
	while [ -z $PROCCEED ]
	do
	read -s -n 1 INPUT </dev/tty
	case ${INPUT} in
	y )	PROCCEED=1
		break
		;;
	n )	echo "Exit"
		PROCCEED=0
		exit
		;;
	* )	echo "Not a valid option, please enter y or n"
		;;
	esac
	done

fi

# dump list of opcodes to the output file
csound -z >$OUTFILE 2>&1

# crop to the list of opcodes and split one opcode by line
sed -i -e '1,/^$/d' -e '/ opcodes$/,$d' -e 's/[ \t]\+/\n/g' $OUTFILE
# remove words related to instrument and opcode definition
# and control opcodes
sed -i -e '/\<instr\>\|\<endin\>\|\<opcode\>\|\<endop\>/d' \
	-e '/\<cggoto\>\|\<cigoto\>\|\<cingoto\>\|\<ckgoto\>\|\<cngoto\>\|\<cnkgoto\>/d' \
	-e '/\<goto\>\|\<igoto\>\|\<kgoto\>\|\<rigoto\>\|\<tigoto\>\|\<timout\>/d' \
	-e '/\<loop_ge\>\|\<loop_gt\>\|\<loop_le\>\|\<loop_lt\>/d' \
	$OUTFILE
# number of opcodes
OPCODES=`wc $OUTFILE | sed -e 's/  .*//' -e 's/ *//'`

sed -i 's/^/syn keyword CsOpcode /' $OUTFILE
sed -i "1i \" $OPCODES opcodes" $OUTFILE
sed -i "1i \" $CSOUNDVERSION" $OUTFILE
echo ""
echo "Writing list of $OPCODES opcodes to $OUTFILE"
echo ""
exit


