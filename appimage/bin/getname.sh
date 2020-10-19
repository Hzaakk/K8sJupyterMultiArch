#!/bin/sh
echo jpr$(cat /dev/urandom | tr -dc 'a-z' | fold -w 8 | head -n1)
