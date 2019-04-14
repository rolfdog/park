#/bin/bash
clear
cd ~

echo "This script was forked from CryptoNeverSleeps"
echo "Ubuntu 16.04 is the recommended opearting system for this install."

cd ~
echo "Removing any zip file of previous install"

wget https://github.com/rolfdog/park/raw/master/DAPSX-cli
wget https://github.com/rolfdog/park/blob/master/DAPSX-stripped-compiled/DAPSX-stripped-compiled/DAPSXd
wget https://github.com/rolfdog/park/blob/master/DAPSX-stripped-compiled/DAPSX-stripped-compiled/DAPSX-tx

sudo mv -f DAPSX-cli /usr/local/bin
sudo mv -f DAPSXd /usr/local/bin
sudo mv -f DAPSX-tx /usr/local/bin
echo -e ""
echo "! Restarting LeisureCoin Masternode !"
echo -e ""
cd ~/.DAPSXMN
sudo rm budget.dat db.log debug.log fee_estimates.dat DAPSXd.pid mnpayments.dat mncache.dat
sudo rm -R backups/
sudo rm -R blocks/
sudo rm -R chainstate/
sudo rm -R database/
sudo rm -R sporks/
sudo DAPSX-cli stop
echo ""
echo "If you see any file not found errors, that is ok!"
echo ""
echo "DAPSX Masternode restarted"
