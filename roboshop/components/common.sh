HEAD(){
    echo -n -e "\e[1m $1 \e[0m \t\t..."
}

STAT(){
  if [ $1 -eq 0 ]; then
    echo -e "\e[1;32m done\e[0m"
  else
  echo -e "\e[1;31m failed\e[0m"
  fi
}