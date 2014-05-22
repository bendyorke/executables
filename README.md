A collection of bash executables.

##tm

This command is a tmux session manager, that aliases and automates a lot of helpful functions

###usage

```
   tm [-l][-k][-r|-n]
```

###details

```
  tm
```
Starts or joins a tmux-session, named with the basename of your current directory

```
  tm -l
```
Alias to tmux list-sessions with a better error message

```
  tm -k
```
Kills a tmux session named with the basename of your current directory

```
  tm -K
```
Kills tmux server (and ALL sessions!)

```
  tm -r / tm -n
```
Restarts/creates a new tmux session for the current directory your in

##pair

This command was written for two reasons:
  1 - Since I host remote pairing sessions, I would repeatedly type the same thing over and over.  I wanted to simply be able to write 'pair'
  2 - I wanted to automate the retrival of ip adresses, be it internal or external

###usage

```
   pair [-e][-e--force][-p port][-a ip-address][-c|-t command]
```

###details

```
  pair
```
Connects to pairing account, also outputs command for people to join locally

```
  pair -e
```
Connects to pairing account, also outputs command for people to join externally

```
  pair -e--force
```
Connect to pairing account externally, also outputs command for people to join externally

```
  pair -p port
```
Connects to pairing account on specified port

```
  pair -a ip-adress
```
Connects to pairing account at specified address

```
  pair -c|-t command
```
Connects to pairing account, runs specified command once shell opens.  Stays in ssh session
