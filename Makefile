# OSX Makefile

fasp-blockchain: src/FaspBlockchainApp.java
	mkdir -p build
	javac -classpath lib/aspera-cmdclient.jar src/FaspBlockchainApp.java -d build
	java -classpath lib/aspera-cmdclient.jar:build FaspBlockchainApp

clean:
	rm -Rf build
