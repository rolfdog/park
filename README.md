# park
lemnmulti

apt-get update

apt-get update -y

apt-get install cpulimit

cat > LSR-multi-mn.sh

CTRL+C

nano LSR-multi-mn.sh

Copy paste the script in to the document located here https://github.com/rolfdog/park/blob/master/LeisureCoin_mn_install_multi.sh

CTRL+X

y

Enter

sudo chmod 777 -R *

sh LSR-multi-mn.sh

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


To limit cpu usage you need to run cpu limits on each mn instance Type

"Top" to see mn running then hit key combination 

"CTRL+C" to exit Top on the right hand side you will see your program identity number 

take note and edit each -p instance with that number in this format

MN1+ copy paste instruction below 

cpulimit -c 2 -P /home/mn1/LeisureCoind -l 20 -b

CTRL+C

MN2+ copy paste instruction below 

cpulimit -c 2 -P /home/mn2/LeisureCoind -l 20 -b


CTRL+C

MN3+ copy paste instruction below 

cpulimit -c 2 -P /home/mn3/LeisureCoind -l 20 -b

CTRL+C

MN4+ copy paste instruction below 

cpulimit -c 2 -P /home/mn4/LeisureCoind -l 20 -b

CTRL+C

Then type "Top" Note that the cpu limited to 20% for each mn instance  
