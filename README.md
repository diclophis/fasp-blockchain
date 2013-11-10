<p>
  <img src='https://raw.github.com/diclophis/a-bit-faster/master/doc/LogoABitFaster.png'/>
</p>

# ABitFaster

### Towards a faster BitCoin blockchain

## Why?

To securely send and receive [BitCoins](http://bitcoin.org/en/), it's important to have a full copy of the BitCoin blockchain, BitCoin's public ledger and shared history.  However, the BitCoin blockchain is currently 9GB and growing, which is a serious impediment to new user adoption due to an initial download that can take days.

For BitCoins to become mainstream, any roadblocks to getting started should be removed.  In order to improve the BitCoin first time experience (FTUX), we are utilizing Aspera's fasp technology for significantly accelerated blockchain downloads and setup.

ABitFaster is a product of the Launch 2013 Hackathon in San Francisco by Jon Bardin and Andrew Cantino.

## How?

In the Terminal, just run `make` in this repository, and the blockchain will start to transfer.  After the download finishes, further instructions will be shown.

### Full details

After you run `make`, we launch a bundled copy of Aspera's command-line [fasp](http://download.asperasoft.com/download/docs/ascp/2.7/html/index.html) client (`ascp`) and start to download a cached copy of the BitCoin blockchain from an Amazon EC2 server.  When the download finishes, we expand the archive and provide instructions to you on how to continue.  You will run `make client` to fetch, expand, and copy the current official BitCoin client (if you don't already have it), then you'll copy the fetched blockchain into your new client's blockchain directory.  From there, you should be able to just launch the client and it will be ready to go after a few additional minutes of synchronization.

## Other questions?

### What is fasp?

Downloads using [Aspera's fasp](http://asperasoft.com/technology/transport/fasp/) transport protocol "achieve speeds that are hundreds of times faster than FTP/HTTP and provide a guaranteed delivery time regardless of file size, transfer distance or network conditions, including transfers over satellite, wireless, and inherently long distance and unreliable international links."  We take advantage of the speed and reliability of the fasp protocol to pull the full BitCoin blockchain down from an Amazon EC2 node to client computers very quickly.

### Is this production ready?

No.  This project is a proof-of-concept built for the Launch 2013 Hackathon.  We have not finished setup of production servers with a continuously-updated blockchain.  We do not recommend that you rely on this project for blockchain download until we have finished all setup.

### What about MultiBit and SPV wallets?

MultiBit is a fairly new SPV wallet that uses an alternative verification scheme and checkpointed blockchain segments to get users started with BitCoin more quickly.  This technique is reasonably secure, but is not as safe as having a full copy of the blockchain, which ABitFaster provides.  Potential issues with SPV include:

* Inability to prove transactions using the full blockchain history.
* Potential for security compromises on the servers that host the checkpointed blockchain.
* Greater susceptibility to DoS attacks.
* Not relaying transactions, thus making it more obvious what BitCoins you own.  (This will be fixed in the future.)

<p>
  <img src='https://raw.github.com/diclophis/a-bit-faster/master/doc/bitcoin.png'/>
</p>
