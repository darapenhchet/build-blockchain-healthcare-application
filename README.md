# Building Blockchain Healthcare Application

This project showcases the use of blockchain in insurance domain for claim processing. In this application, we have three participants, namely patient, hospital and insurance peer. patient peer is the person who providing the life log data. Hospital peer is responsible for storing the patients' information and verify the patient from the insurance company. Insurance peer is responsible for providing the insurance for the patients and it is responsible for processing the claims.

## Included Components
* Hyperledger Fabric
* Docker 

## Application Workflow Diagram

1. GENERATE CERTIFICATES FOR PEERS IN NETWORK 
2. BUILD DOCKER IMAGES FOR NETWORK
3. START THE INSURANCE NETWORK

## Prerequisites
* Docker - v1.13 or higher
* Docker compose - v1.8 or higher
* Node.js & npm - node v6.2.0- v6.10. (v7+ not supoorted); npm comes with your node installation.
* Git client - needed for clone command

Quick Start Steps for Mac and Ubuntu

For Mac user:
1. git clone https://github.com/CBNU-BigDataLab/build-blockchain-healthcare-app.git
2. cd build-blockchain-healthcare-app
3. ./build_mac.sh
4. Use the link http://localhost:3000 to load the web application in browser.

For Ubuntu user
1. git clone https://github.com/CBNU-BigDataLab/build-blockchain-healthcare-app.git
2. cd build-blockchain-healthcare-app
3. ./build_ubuntu.sh
4. Use the link http://localhost:3000 to load the web application in browser.

