# OSX Makefile

blockchain.tar.gz:
	ASPERA_SCP_PASS=aspera ASPERA_SCP_COOKIE=`hostname` bin/mac-intel-10.6/ascp xfer@hack1.aspera.us:/btc/blockchain.tar.gz /tmp/blockchain.tar.gz
	mv /tmp/blockchain.tar.gz .
	gunzip blockchain.tar.gz
	tar -xvf blockchain.tar

client: bitcoin-0.8.5-macosx.dmg
	hdiutil attach bitcoin-0.8.5-macosx.dmg
	cp -r /Volumes/Bitcoin-Qt/Bitcoin-Qt.app .
	# open Bitcoin-Qt.app --args -loadblock=blk0001.dat -loadblock=blk0002.dat

bitcoin-0.8.5-macosx.dmg:
	wget http://sourceforge.net/projects/bitcoin/files/Bitcoin/bitcoin-0.8.5/bitcoin-0.8.5-macosx.dmg/download -O bitcoin-0.8.5-macosx.dmg

fasp-blockchain: src/FaspBlockchainApp.java
	mkdir -p build
	javac -classpath lib/aspera-cmdclient.jar src/FaspBlockchainApp.java -d build
	java -classpath lib/aspera-cmdclient.jar:build FaspBlockchainApp

clean:
	rm -Rf build
