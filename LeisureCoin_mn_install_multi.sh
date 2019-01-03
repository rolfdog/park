echo "Installing required packages";

add-apt-repository ppa:bitcoin/bitcoin && apt-get -y update && apt-get -y install libboost-all-dev libcrypto++-dev libqrencode-dev libminiupnpc-dev libgmp-dev libgmp3-dev autoconf autogen automake bsdmainutils libzmq3-dev libminiupnpc-dev libevent-dev libdb4.8-dev libdb4.8++-dev unzip

echo "Done installing";

dd if=/dev/zero of=/swapfile bs=1M count=4096 && chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile && /etc/fstab

echo "Setting up user accounts";

useradd -m -s /bin/bash mn1 && useradd -m -s /bin/bash mn2 && useradd -m -s /bin/bash mn3 && useradd -m -s /bin/bash mn4 && usermod -aG sudo mn1 && usermod -aG sudo mn2 && usermod -aG sudo mn3 && usermod -aG sudo mn4

NODEIP=$(curl -s4 icanhazip.com)

RPCUSR1=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w10 | head -n1)
RPCPW1=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w22 | head -n1)
PORT1=9333
RPCPORT1=9334

RPCUSR2=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w10 | head -n1)
RPCPW2=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w22 | head -n1)
PORT2=9335
RPCPORT2=9336

RPCUSR3=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w10 | head -n1)
RPCPW3=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w22 | head -n1)
PORT3=9337
RPCPORT3=9338

RPCUSR4=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w10 | head -n1)
RPCPW4=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w22 | head -n1)
PORT4=9339
RPCPORT4=9340

echo "Installing masternode 1";

cd /home/mn1 && mkdir .LeisureCoin && chmod -R 777 .LeisureCoin

cat << EOF > /home/mn1/.LeisureCoin/LeisureCoin.conf
rpcuser=$RPCUSR1
rpcpassword=$RPCPW1
rpcport=$RPCPORT1
rpcallowip=127.0.0.1
listen=1
server=1
daemon=1
port=$PORT1

EOF

cd /root && wget https://github.com/LeisureCoinProject/LeisureCoin-Core/releases/download/1.1.0.3/LeisureCoin-Linux64bit-qt.zip && unzip LeisureCoin-Linux64bit-qt.zip
cp LeisureCoin-cli LeisureCoind LeisureCoin-tx /home/mn1 && chmod -R 777 /home/mn1/LeisureCoin-cli && chmod -R 777 /home/mn1/LeisureCoind && chmod -R 777 /home/mn1/LeisureCoin-tx
cp LeisureCoin-cli LeisureCoind LeisureCoin-tx /home/mn2 && chmod -R 777 /home/mn2/LeisureCoin-cli && chmod -R 777 /home/mn2/LeisureCoind && chmod -R 777 /home/mn2/LeisureCoin-tx
cp LeisureCoin-cli LeisureCoind LeisureCoin-tx /home/mn3 && chmod -R 777 /home/mn3/LeisureCoin-cli && chmod -R 777 /home/mn3/LeisureCoind && chmod -R 777 /home/mn3/LeisureCoin-tx
cp LeisureCoin-cli LeisureCoind LeisureCoin-tx /home/mn4 && chmod -R 777 /home/mn4/LeisureCoin-cli && chmod -R 777 /home/mn4/LeisureCoind && chmod -R 777 /home/mn4/LeisureCoin-tx

su - mn1 -c './LeisureCoind -daemon'
sleep 20

KEY1=$(su - mn1 -c './LeisureCoin-cli masternode genkey')
KEY2=$(su - mn1 -c './LeisureCoin-cli masternode genkey')
KEY3=$(su - mn1 -c './LeisureCoin-cli masternode genkey')
KEY4=$(su - mn1 -c './LeisureCoin-cli masternode genkey')

su - mn1 -c './LeisureCoin-cli stop'
echo "will wait 60 seconds..";
sleep 60

cat << EOF >> /home/mn1/.LeisureCoin/LeisureCoin.conf
bind=$NODEIP:$PORT1
gen=1
masternode=1
masternodeprivkey=$KEY1
externalip=$NODEIP:$PORT1
addnode=91.121.209.203
addnode=144.202.59.174
addnode=209.250.240.10
addnode=108.61.89.169
addnode=95.179.135.170
addnode=80.211.171.30
addnode=159.203.112.169
addnode=45.32.44.136
addnode=194.182.82.199

EOF

echo "Installing masternode 2";

cd /home/mn2 && mkdir .LeisureCoin && chmod -R 777 .LeisureCoin

cat << EOF > /home/mn2/.LeisureCoin/LeisureCoin.conf
rpcuser=$RPCUSR2
rpcpassword=$RPCPW2
rpcport=$RPCPORT2
rpcallowip=127.0.0.1
listen=1
server=1
daemon=1
port=$PORT2
bind=$NODEIP:$PORT2
gen=1
masternode=1
masternodeprivkey=$KEY2
externalip=$NODEIP:$PORT2
addnode=91.121.209.203
addnode=144.202.59.174
addnode=209.250.240.10
addnode=108.61.89.169
addnode=95.179.135.170
addnode=80.211.171.30
addnode=159.203.112.169
addnode=45.32.44.136
addnode=194.182.82.199

EOF

echo "Installing masternode 3";

cd /home/mn3 && mkdir .LeisureCoin && chmod -R 777 .LeisureCoin

cat << EOF > /home/mn3/.LeisureCoin/LeisureCoin.conf
rpcuser=$RPCUSR3
rpcpassword=$RPCPW3
rpcport=$RPCPORT3
rpcallowip=127.0.0.1
listen=1
server=1
daemon=1
port=$PORT3
bind=$NODEIP:$PORT3
gen=1
masternode=1
masternodeprivkey=$KEY3
externalip=$NODEIP:$PORT3
addnode=91.121.209.203
addnode=144.202.59.174
addnode=209.250.240.10
addnode=108.61.89.169
addnode=95.179.135.170
addnode=80.211.171.30
addnode=159.203.112.169
addnode=45.32.44.136
addnode=194.182.82.199

EOF

echo "Installing masternode 4";

cd /home/mn4 && mkdir .LeisureCoin && chmod -R 777 .LeisureCoin

cat << EOF > /home/mn4/.LeisureCoin/LeisureCoin.conf
rpcuser=$RPCUSR4
rpcpassword=$RPCPW4
rpcport=$RPCPORT4
rpcallowip=127.0.0.1
listen=1
server=1
daemon=1
port=$PORT4
bind=$NODEIP:$PORT4
gen=1
masternode=1
masternodeprivkey=$KEY4
externalip=$NODEIP:$PORT4
addnode=91.121.209.203
addnode=144.202.59.174
addnode=209.250.240.10
addnode=108.61.89.169
addnode=95.179.135.170
addnode=80.211.171.30
addnode=159.203.112.169
addnode=45.32.44.136
addnode=194.182.82.199

EOF

echo "Starting LeisureCoin clients";
cd /root
rm LeisureCoin_mn_install_multi.sh
rm LeisureCoind
rm LeisureCoin-cli
rm LeisureCoin-tx
rm leisure_mn.zip
su - mn1 -c './LeisureCoind'
su - mn2 -c './LeisureCoind'
su - mn3 -c './LeisureCoind'
su - mn4 -c './LeisureCoind'
sleep 5

echo "

*** Your LeisureCoin masternodes are now installed. Please wait for the wallets to be fully synced. ***

*** You can get the current block height with: 

Masternode 1: su - mn1 -c './LeisureCoin-cli getblockcount'
Masternode 2: su - mn2 -c './LeisureCoin-cli getblockcount'
Masternode 3: su - mn3 -c './LeisureCoin-cli getblockcount'
Masternode 4: su - mn4 -c './LeisureCoin-cli getblockcount'

***

*** Configuration lines for your local masternode.conf:

Masternode 1: MN1 $NODEIP:$PORT1 $KEY1 txid index
Masternode 2: MN2 $NODEIP:$PORT2 $KEY2 txid index
Masternode 3: MN3 $NODEIP:$PORT3 $KEY3 txid index
Masternode 4: MN4 $NODEIP:$PORT4 $KEY4 txid index

*** Start your masternode from your wallet and check the status with:

Masternode 1: su - mn1 -c './LeisureCoin-cli masternode status'
Masternode 2: su - mn2 -c './LeisureCoin-cli masternode status'
Masternode 3: su - mn3 -c './LeisureCoin-cli masternode status'
Masternode 4: su - mn4 -c './LeisureCoin-cli masternode status'

***";

exit 1
