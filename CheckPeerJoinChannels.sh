#!/bin/bash

export FABRIC_START_WAIT=5
echo -e '******\e[5;32;40mList of orgs and their subscriptions to insurances blockchain\e[m************************************'

echo -e '******\e[5;32;40mInsurance (insurances)\e[m************************************'
docker exec insurance.cli bash -c 'peer channel list'
sleep ${FABRIC_START_WAIT}
echo -e '******\e[5;32;40mHospital  (insurances)\e[m************************************'
docker exec insurance.cli bash -c 'CORE_PEER_ADDRESS=hospital-peer:7051 CORE_PEER_LOCALMSPID=HospitalOrgMSP CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/hospital-org/users/Admin@hospital-org/msp peer channel list'