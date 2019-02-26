#!/usr/bin/env bash

count_to=$(bc <<< '100000000')

jot $count_to
