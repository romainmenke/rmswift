# credits to the interwebs, use as you please
# composed by R Menke

# BUILD
if [ "$1" == "build" ]; then

  mkdir -p $RMSWIFTPATH/bin/debug
  mkdir -p $RMSWIFTPATH/pkg/debug

  buildDir=$RMSWIFTPATH/bin

  if [ -f "$RMSWIFTPATH/src/$3/Sources/main.swift" ]; then
    buildDir=$RMSWIFTPATH/bin
  else
    buildDir=$RMSWIFTPATH/pkg
  fi

  tempPWD=$pwd

  if [ "$2" == "debug" ]; then

    cd $RMSWIFTPATH/src/$3
    rm -f $buildDir/debug/$(basename $3)

    swift build --clean
    swift build --configuration debug

    mkdir -p $buildDir/debug/$(basename $3)
    cp -r $RMSWIFTPATH/src/$3/.build/debug/ $buildDir/debug/$(basename $3)

  elif [ "$2" == "release" ]; then

    cd $RMSWIFTPATH/src/$3
    rm -f $buildDir/$(basename $3)

    swift build --clean
    swift build --configuration release

    mkdir -p $buildDir/$(basename $3)
    cp -r $RMSWIFTPATH/src/$3/.build/release/ $buildDir/$(basename $3)

  else

    cd $RMSWIFTPATH/src/$2
    $buildDir/$(basename $2)

    swift build --clean
    swift build --configuration debug

    mkdir -p $buildDir/debug/$(basename $2)
    cp -r $RMSWIFTPATH/src/$2/.build/debug/ $buildDir/debug/$(basename $2)

  fi

  cd $tempPWD

# CLEAN
elif [ "$1" == "clean" ]; then

    tempPWD=$pwd
    cd $RMSWIFTPATH/src/$2
    swift build --clean
    cd $tempPWD

# CREATE
elif [ "$1" == "create" ]; then

  mkdir -p $RMSWIFTPATH/src/$2
  touch $RMSWIFTPATH/src/$2/Package.swift
  mkdir -p $RMSWIFTPATH/src/$2/Sources

# GET
elif [ "$1" == "get" ]; then

  mkdir -p $RMSWIFTPATH/src/$2
  git clone https://$2 $RMSWIFTPATH/src/$2


# INFO
elif [ "$1" == "help" ] || [ "$1" == "info" ]; then

  echo ""
  echo "create          :->   create empty swift file in src dir"
  echo "build           :->   build in RMSWIFTPATH"
  echo "build debug     :->   build debug in RMSWIFTPATH"
  echo "build release   :->   build release in RMSWIFTPATH"
  echo "clean           :->   clean .build dir of package"
  echo "get             :->   clone git repo into RMSWIFTPATH/src/"
  echo ""

fi
