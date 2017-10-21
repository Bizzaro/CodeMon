# CodeMon
If you've done any server side JavaScript development with Node.js, you might have heard of the tool "Nodemon". It basically watches the file for any changes and restarts the server.  

I've written an extremely simple/clean/portable/short implementation to do the same thing, except it works on more than just JavaScript files. I am well aware that there are other implemenations, however they are extremely bloated and use external libraries... why do that when there's a so much more efficient way by using pure bash :).

# Usage
You can customize the command to be whatever you want through run-time arguments.  

`./watch.sh <file to watch> <command to run when changed>`
Ex. 
`./watch.sh HelloWorld.java ./run.sh`

A good tool to use in combination with this would be to use GNU make and a Makefile to automate clean, builds, deploys, whatever. 
`./watch.sh HelloWorld.java make`

# Compatibility
Only works with UNIX - like systems.
