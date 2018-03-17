
#!/bin/bash

export FABRIC_START_WAIT=5

echo -e '-----------------------\e[5;32;40m Install chaincodes\e[m---------------------------------------------------------'
echo " ----------------------------- For Insurance channel --------------------------------------------"
docker exec insurance.cli bash -c 'CORE_PEER_ADDRESS=insurance-peer:7051 CORE_PEER_LOCALMSPID=InsuranceOrgMSP CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/insurance-org/users/Admin@insurance-org/msp peer chaincode install -p github.com/healthcare-insurances -n insuranceschaincode -v 0.0.1'
sleep ${FABRIC_START_WAIT}
docker exec insurance.cli bash -c 'CORE_PEER_ADDRESS=hospital-peer:7051 CORE_PEER_LOCALMSPID=HospitalOrgMSP CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/hospital-org/users/Admin@hospital-org/msp peer chaincode install -p github.com/healthcare-insurances -n insuranceschaincode -v 0.0.1'

sleep ${FABRIC_START_WAIT}
echo -e "-----------------------'\e[5;32;40m Instantiate chaincodes\e[m---------------------------------------------------------"
echo "---------------Instantiate chaincode on insurances channel"
# docker exec insurance.cli bash -c "CORE_PEER_ADDRESS=insurance-peer:7051 CORE_PEER_LOCALMSPID=InsuranceOrgMSP CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/insurance-org/users/Admin@insurance-org/msp peer chaincode instantiate -C insurances -n insuranceschaincode -v 0.0.1 -c '{\"Args\":[]}'  -P \"OR ('InsuranceOrgMSP.member', 'HospitalOrgMSP.member')\""
# sleep ${FABRIC_START_WAIT}
docker exec insurance.cli bash -c "CORE_PEER_ADDRESS=hospital-peer:7051 CORE_PEER_LOCALMSPID=HospitalOrgMSP CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/hospital-org/users/Admin@hospital-org/msp peer chaincode instantiate -C insurances -n insuranceschaincode -v 0.0.1 -c '{\"Args\":[]}'  -P \"OR ('InsuranceOrgMSP.member', 'HospitalOrgMSP.member')\""