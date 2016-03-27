# rmswift
Golang style "get" command for Swift

If you are not familiar with Go : google is your best friend!


# Install with [rmbash](https://github.com/romainmenke/rmbash)

Create directories:
```
 mkdir -p anywhereYouLike/MySwiftDirectory/
```

I chose : 
```
 mkdir -p $HOME/Swift
```
 
Add to .bash_profile
```
 export RMSWIFTPATH=anywhereYouLike/MySwiftDirectory
```

I chose : 
```
 export RMSWIFTPATH=$HOME/Swift
```

```
rmbash get github.com/romainmenke/rmswift
rmbash install github.com/romainmenke/rmswift
```

You are good to go!


# Commands (rmbash)
```
 info || help 

 create    :->   create empty bash script in src dir
 get       :->   clone git repo into RMSWIFTPATH/src/

```

# Licence

Use it however you like

# Notes

I was contemplating a "put" command but decided not to as it would promote username and password login, which is not ideal and it would have made this tool not-simple. 

The "get" command is just sugar for "git clone". It is not perfect.
