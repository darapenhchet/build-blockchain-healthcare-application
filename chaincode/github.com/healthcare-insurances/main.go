package main

import (
	"fmt"

	"github.com/hyperledger/fabric/core/chaincode/shim"
	sc "github.com/hyperledger/fabric/protos/peer"
)

// TODO: DEFINE THE SMART CONTRACT STRUCTURE
type SmartContract struct {
}

func (s *SmartContract) Init(APIStub shim.ChaincodeStubInterface) sc.Response {
	fmt.Println("==================================INIT FUNCTION====================================")
	return shim.Success(nil)
}

func (s *SmartContract) Invoke(APIStub shim.ChaincodeStubInterface) sc.Response {
	fmt.Println("==================================INVOKE FUNCTION====================================")
	// TODO: TO GET THE REQUESTED SMART CONTRACT FUNCTION AND ARGUMENTS
	function, args := APIStub.GetFunctionAndParameters()
	// TODO: TO ROUTE TO THE APPROPRIATE HANDLER FUNCTION TO INTERACT WITH THE LEDGER APPROPRIATELY
	if function == "initLedger" {
		return s.initLedger(APIStub)
	} else if function == "queryAllPatients" {
		return s.queryAllPatients(APIStub)
	} else if function == "queryPatientByID" {
		return s.queryPatientByID(APIStub, args)
	}
	return shim.Error("Invalid Smart Contract function name.")
}

// TODO: initLedger Method
func (s *SmartContract) initLedger(APIStub shim.ChaincodeStubInterface) sc.Response {
	return shim.Success(nil)
}

// TODO: queryAllpatients Method
func (s *SmartContract) queryPatientByID(APIStub shim.ChaincodeStubInterface, args []string) sc.Response {
	return shim.Success(nil)
}

func (s *SmartContract) queryAllPatients(APIStub shim.ChaincodeStubInterface) sc.Response {
	return shim.Success(nil)
}

func main() {
	fmt.Println("==================================MAIN FUNCTION====================================")
	// TODO: CREATE A NEW SMART CONTRACT
	err := shim.Start(new(SmartContract))
	if err != nil {
		fmt.Printf("Error creating new Smart Contract: %s", err)
	}
	fmt.Println("Successfully initialized smart contract")
}
