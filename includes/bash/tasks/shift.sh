#!/usr/bin/env bash

ITERATIONS=0
while [ ! -z $1 ] ; do
    echo $1
    shift
    ITERATIONS=$(( $ITERATIONS + 1 ))
    [ $ITERATIONS -gt 100 ] && break
done
