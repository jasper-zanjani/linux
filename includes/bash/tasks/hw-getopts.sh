#!/usr/bin/env bash

OPTSTRING='n:'
while getopts ${OPTSTRING} OPTIONS; do
    case ${OPTIONS} in 
        n) echo "Hello, ${OPTARG}!" ;;
        ?) echo "Invalid option: -${OPTARG}" ;;
    esac
done
