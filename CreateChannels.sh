#!/bin/bash

export FABRIC_START_WAIT=5

echo -e "-------------------------\e[5;32;40mNow Creating channels\e[m -----------------------------"
# docker exec insurance-cli bash -c 'peer channel create -c insurances -f /opt/gopath/src/github.com/hyperledger/fabric/peer/channels/channel.tx -o orderer0:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/orderer/msp/tlscacerts/tlsca.orderer-org-cert.pem'
docker exec insurance.cli bash -c 'peer channel create -c insurances -f ./channels/channel.tx -o orderer0:7050'
sleep ${FABRIC_START_WAIT}
echo -e "-------------------------\e[5;32;40mNow Joining channels\e[m -----------------------------"
docker exec insurance.cli bash -c 'CORE_PEER_ADDRESS=insurance-peer:7051 CORE_PEER_LOCALMSPID=InsuranceOrgMSP CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/insurance-org/users/Admin@insurance-org/msp peer channel join -b insurances.block'
sleep ${FABRIC_START_WAIT}
docker exec insurance.cli bash -c 'CORE_PEER_ADDRESS=hospital-peer:7051 CORE_PEER_LOCALMSPID=HospitalOrgMSP CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/hospital-org/users/Admin@hospital-org/msp peer channel join -b insurances.block'

sleep ${FABRIC_START_WAIT}
echo -e ".. \e[5;32;40mlet us use the anchor peer update transactions:\e[m"
docker exec insurance.cli bash -c 'CORE_PEER_ADDRESS=insurance-peer:7051 CORE_PEER_LOCALMSPID=InsuranceOrgMSP CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/insurance-org/users/Admin@insurance-org/msp peer channel update -o orderer0:7050 -c insurances -f ./channels/InsuranceOrgMSPAnchors.tx'
sleep ${FABRIC_START_WAIT}
docker exec insurance.cli bash -c 'CORE_PEER_ADDRESS=hospital-peer:7051 CORE_PEER_LOCALMSPID=HospitalOrgMSP CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/hospital-org/users/Admin@hospital-org/msp peer channel update -o orderer0:7050 -c insurances -f ./channels/HospitalOrgMSPAnchors.tx'
