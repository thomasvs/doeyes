#!/bin/bash

DIRNAME=`dirname $0`
BINDIR=`cd $DIRNAME && pwd`
BASEDIR=`cd $DIRNAME/.. && pwd`

if test -z "$1"
then
	PERIOD=2022-2023
else
	PERIOD=$1
fi

head -n 4 "`ls $BASEDIR/$PERIOD/*ics | head -n 1`" > $BASEDIR/output/$PERIOD.ics
for a in $BASEDIR/$PERIOD/*ics; do tail -n +5 "$a" | head -n -1; done >> $BASEDIR/output/$PERIOD.ics
tail -n 1 "`ls $BASEDIR/$PERIOD/*ics | head -n 1`" >> $BASEDIR/output/$PERIOD.ics
