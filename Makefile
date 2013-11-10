# OSX Makefile

blockchain.tar.gz:
	bin/mac-intel-10.6/ascp xfer@hack1.aspera.us:/btc/blockchain.tar.gz /tmp/blockchain.tar.gz

fasp-blockchain: src/FaspBlockchainApp.java
	mkdir -p build
	javac -classpath lib/aspera-cmdclient.jar src/FaspBlockchainApp.java -d build
	java -classpath lib/aspera-cmdclient.jar:build FaspBlockchainApp

clean:
	rm -Rf build
