# OSX Makefile

fasp-blockchain: src/CmdClientSample.java
	mkdir -p build
	javac -classpath lib/aspera-cmdclient.jar src/CmdClientSample.java -d build
	java -classpath lib/aspera-cmdclient.jar:build CmdClientSample

clean:
	rm -Rf build
