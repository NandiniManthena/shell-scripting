#!/bin/bash

##Declare a function

SAMPLE(){
  echo welcome
  echo value of a = $a
  b=20

}
##Access the function
a=10
SAMPLE
echo value of b= $b