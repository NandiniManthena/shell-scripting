#!/bin/bash

##Declare a function

SAMPLE(){
  echo welcome
  echo value of a = $a
  b=20
  echo first argumennt = $1

}
##Access the function
a=10
SAMPLE xyz
SAMPLE $1
echo value of b= $b