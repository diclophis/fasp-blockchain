<p>
  <img src='https://raw.github.com/diclophis/fasp-blockchain/master/doc/LogoABitFaster.png'/>
</p>

# ABitFaster

## Why?  Towards a faster BitCoin blockchain

To securely send and receive [BitCoins](http://bitcoin.org/en/), it's important to have a full copy of the BitCoin blockchain, BitCoin's public ledger and shared history.  However, the BitCoin blockchain is currently 9GB and growing, which is a serious impediment to new user adoption due to an initial download that can take days.

For BitCoins to become mainstream, any roadblocks to getting started should be removed.  In order to improve the BitCoin first time experience (FTUX), we are utilizing Aspera's fasp technology for significantly accelerated blockchain downloads.

## What?

[Aspera's fasp](http://asperasoft.com/technology/transport/fasp/) transport protocol "transfers achieve speeds that are hundreds of times faster than FTP/HTTP and provide a guaranteed delivery time regardless of file size, transfer distance or network conditions, including transfers over satellite, wireless, and inherently long distance and unreliable international links."  We take advantage of the speed and reliability of the fasp protocol to pull the full BitCoin blockchain down from an Amazon EC2 node to clients' computers very quickly.

ABitFaster is a product of the Launch 2013 Hackathon in San Francisco by Jon Bardin and Andrew Cantino.

## How?

For now, just run `make` in this repository, enter the password `aspera`, and the blockchain will start to transfer.
