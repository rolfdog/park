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
sudo mv -f LeisureCoin-cli /usr/local/bin
sudo mv -f LeisureCoind /usr/local/bin
sudo mv -f LeisureCoin-tx /usr/local/bin
sudo rm leisure_mn.zip
echo -e ""
echo "! Restarting LeisureCoin Masternode !"
echo -e ""
cd ~/.LeisureCoin
sudo rm budget.dat db.log debug.log fee_estimates.dat LeisureCoind.pid mnpayments.dat mncache.dat
sudo rm -R backups/
sudo rm -R blocks/
sudo rm -R chainstate/
sudo rm -R database/
sudo rm -R sporks/
sudo LeisureCoin-cli stop
echo ""
echo "If you see any file not found errors, that is ok!"
echo ""
echo "LeisureCoin Masternode restarted"
