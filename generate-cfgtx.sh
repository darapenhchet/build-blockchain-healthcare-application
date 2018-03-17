#!/bin/sh

CHANNEL_NAME="insurances"
PROJPATH=$(pwd)
CHANNELPATH=$PROJPATH/channels

echo
echo "##########################################################"
echo "#########  Generating Orderer Genesis block ##############"
echo "##########################################################"
$PROJPATH/configtxgen -profile HealthcareOrdererGenesis -outputBlock $CHANNELPATH/genesis.block

mkdir channels
echo
echo "#################################################################"
echo "### Generating channel configuration transaction 'channel.tx' ###"
echo "#################################################################"
$PROJPATH/configtxgen -profile HealthcareChannel -outputCreateChannelTx $CHANNELPATH/channel.tx -channelID $CHANNEL_NAME
cp $CHANNELPATH/channel.tx $PROJPATH/web

echo
echo "#################################################################"
echo "####### Generating anchor peer update for InsuranceOrg ##########"
echo "#################################################################"
$PROJPATH/configtxgen -profile HealthcareChannel -outputAnchorPeersUpdate $CHANNELPATH/InsuranceOrgMSPAnchors.tx -channelID $CHANNEL_NAME -asOrg InsuranceOrgMSP

echo
echo "#################################################################"
echo "########  Generating anchor peer update for HospitalOrg #########"
echo "#################################################################"
$PROJPATH/configtxgen -profile HealthcareChannel -outputAnchorPeersUpdate $CHANNELPATH/HospitalOrgMSPAnchors.tx -channelID $CHANNEL_NAME -asOrg HospitalOrgMSP