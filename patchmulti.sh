#/bin/bash
clear
cd ~

echo "This script was forked from CryptoNeverSleeps"
echo "Ubuntu 16.04 is the recommended opearting system for this install."
echo

cd ~
echo "Removing any zip file of previous install"
sudo rm leisure_mn.zip
wget https://github.com/LeisureCoinProject/LeisureCoin-Core-Masternode/releases/download/v2.0/leisure_mn.zip
sudo unzip leisure_mn.zip
sudo mv -f LeisureCoin-cli /home/mn1
sudo mv -f LeisureCoind /home/mn1
sudo mv -f LeisureCoin-tx /home/mn1
sudo mv -f LeisureCoin-cli /home/mn2
sudo mv -f LeisureCoind /home/mn2
sudo mv -f LeisureCoin-tx /home/mn2
sudo mv -f LeisureCoin-cli /home/mn3
sudo mv -f LeisureCoind /home/mn3
sudo mv -f LeisureCoin-tx /home/mn3
sudo mv -f LeisureCoin-cli /home/mn4
sudo mv -f LeisureCoind /home/mn4
sudo mv -f LeisureCoin-tx /home/mn4
sudo rm leisure_mn.zip
echo -e ""
echo "! Restarting LeisureCoin Masternode !"
echo -e ""
su - mn1 -c './LeisureCoind -daemon'
su - mn2 -c './LeisureCoind -daemon'
su - mn3 -c './LeisureCoind -daemon'
su - mn4 -c './LeisureCoind -daemon'
sudo rm budget.dat db.log debug.log fee_estimates.dat LeisureCoind.pid mnpayments.dat mncache.dat
sudo rm -R backups/
sudo rm -R blocks/
sudo rm -R chainstate/
sudo rm -R database/
sudo rm -R sporks/
su - mn1 -c './LeisureCoin-cli stop'    
su - mn2 -c './LeisureCoin-cli stop'    
su - mn3 -c './LeisureCoin-cli stop'    
su - mn4 -c './LeisureCoin-cli stop'    
echo ""
echo "If you see any file not found errors, that is ok!"
echo ""
echo "LeisureCoin Masternode restarted"
