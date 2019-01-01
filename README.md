# park
lemnmulti

wget https://github.com/rolfdog/park/blob/master/LeisureCoin_mn_install_multi.sh && chmod 777 LeisureCoin_mn_install_multi.sh && ./LeisureCoin_mn_install_multi.sh

wget https://raw.githubusercontent.com/rolfdog/park/lemnmulti/patchmulti.sh && chmod 777 patchmulti.sh && ./patchmulti.sh

Popular comands to use

sudo nano /home/mn1/.LeisureCoin/LeisureCoin.conf

sudo nano /home/mn2/.LeisureCoin/LeisureCoin.conf 

sudo nano /home/mn3/.LeisureCoin/LeisureCoin.conf 

sudo nano /home/mn4/.LeisureCoin/LeisureCoin.conf 

su - mn1 -c './LeisureCoin-cli stop'

su - mn2 -c './LeisureCoin-cli stop' 

su - mn3 -c './LeisureCoin-cli stop'  

su - mn4 -c './LeisureCoin-cli stop'

su - mn1 -c './LeisureCoind -daemon'  

su - mn2 -c './LeisureCoind -daemon'

su - mn3 -c './LeisureCoind -daemon' 

su - mn4 -c './LeisureCoind -daemon'

su - mn1 -c './LeisureCoin-cli masternode status'

su - mn2 -c './LeisureCoin-cli masternode status'

su - mn3 -c './LeisureCoin-cli masternode status'

su - mn4 -c './LeisureCoin-cli masternode status'

su - mn1 -c './LeisureCoind -reindex' 

su - mn2 -c './LeisureCoind -reindex'

su - mn3 -c './LeisureCoind -reindex'

su - mn4 -c './LeisureCoind -reindex'

apt-get update

apt-get install cpulimit

To limit cpu usage you need to run cpu limits on each mn instance Type

"Top" to see mn running then hit key combination 

"CTRL+C" to exit Top on the right hand side you will see your program identity number 

take note and edit each -p instance with that number in this format

MN1+ copy paste instruction below edit -p to coraspond with the program idenity number associated with MN1

cpulimit -c 2 -p 12345 -l 20 -b

CTRL+C

MN2+ copy paste instruction below edit -p to coraspond with the program idenity number associated with MN2

cpulimit -c 2 -p 12346 -l 20 -b

CTRL+C

MN3+ copy paste instruction below edit -p to coraspond with the program idenity number associated with MN3

cpulimit -c 2 -p 12347 -l 20 -b

CTRL+C

MN2+ copy paste instruction below edit -p to coraspond with the program idenity number associated with MN2

cpulimit -c 2 -p 12348 -l 20 -b

CTRL+C

Then type "Top" Note that the cpu limited to 20% for each mn instance  
