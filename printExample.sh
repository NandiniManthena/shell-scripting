#!/bin/bash

echo Hello People

## echo to print multiple lines
echo -e "Hello,\nWelcome to DevOps training"

## Print Text in Colors
# syntax: echo -e "\e[COLORCODEmMessage"

# COLORS        CODE
# RED           31
# GREEN         32
# YELLOW        33
# BLUE          34
# MAGENTA       35
# CYAN          36

# Syntax: echo -e "\e[CODEmMessage\e[0m"
# 0 is color disable

echo -e "\e[37mHello In Red Color\e[0m"