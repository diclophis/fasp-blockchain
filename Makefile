# OSX Makefile for ABitFaster, a tool for getting started with BitCoin more quickly.

# Fetch and uncompress the current blockchain over Aspera's fasp protocol from the Launch Hackathon EC2 node.
blockchain.tar.gz:
	ASPERA_SCP_PASS=aspera ASPERA_SCP_COOKIE=`hostname` bin/mac-intel-10.6/ascp xfer@hack1.aspera.us:/btc/blockchain.tar.gz /tmp/blockchain.tar.gz
	mv /tmp/blockchain.tar.gz .
	gunzip blockchain.tar.gz
	tar -xvf blockchain.tar
	rm blockchain.tar
	@echo "Now, run 'make client' and copy the contents of blockchain into the appropriate location in ~/Library/Application Support/Bitcoin/blocks."
	@echo "Then, launch the Bitcoin-Qt application now present in this directory."

# Install the current Bitcoin client in this directory
client: bitcoin-0.8.5-macosx.dmg
	hdiutil attach bitcoin-0.8.5-macosx.dmg
	cp -r /Volumes/Bitcoin-Qt/Bitcoin-Qt.app .
	# open Bitcoin-Qt.app --args -loadblock=blk0001.dat -loadblock=blk0002.dat

# download the current Mac OS X disk image for Bitcoin client 0.8.5
bitcoin-0.8.5-macosx.dmg:
	wget http://sourceforge.net/projects/bitcoin/files/Bitcoin/bitcoin-0.8.5/bitcoin-0.8.5-macosx.dmg/download -O bitcoin-0.8.5-macosx.dmg

# beta Java client build (not finished)
fasp-blockchain: src/FaspBlockchainApp.java
	mkdir -p build
	javac -classpath lib/aspera-cmdclient.jar src/FaspBlockchainApp.java -d build
	java -classpath lib/aspera-cmdclient.jar:build FaspBlockchainApp

# cleanup built and downloaded resources
clean:
	rm -f bitcoin-0.8.5-macosx.dmg # cleanup client disk image
	rm -Rf Bitcoin-Qt.app # cleanup client application
	rm -rf blockchain # cleanup previously-fetched blockchain
	rm -Rf build # cleanup beta Java client build directory
