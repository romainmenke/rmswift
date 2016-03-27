# credits to the interwebs, use as you please
# composed by R Menke


# CREATE
if [ "$1" == "create" ]; then

  mkdir -p $RMSWIFTPATH/src/$2
  touch $RMSWIFTPATH/src/$2/$(basename $2).swift

# GET
elif [ "$1" == "get" ]; then

  git clone https://$2 $RMSWIFTPATH/src/$2

# INFO
elif [ "$1" == "help" ] || [ "$1" == "info" ]; then

  echo ""
  echo "create    :->   create empty swift file in src dir"
  echo "get       :->   clone git repo into RMSWIFTPATH/src/"
  echo ""

fi
