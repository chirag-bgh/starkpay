%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin


@storage_var
func INIT_CODE_HASH() -> (res: felt) {
    //bytes32 constant INIT_CODEHASH = keccak256(type(LlamaPay).creationCode);
}

@storage_var
func parameter() -> (address: felt) {

}

@storage_var
func s() -> (res: felt) {
}

@event
func StarkPayCreated(token: felt, starkpay: felt) {
}

@external
func createLlamaPayContract{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    token: felt
) -> (starkpaycontract: felt){
    parameter.write(token)
    // llamaPayContract = address(new LlamaPay{salt: bytes32(uint256(uint160(_token)))}());
    // require(llamaPayContract != address(0));

    //     // Append the new contract address to the array of deployed contracts
    //     uint256 index = getLlamaPayContractCount;
    //     getLlamaPayContractByIndex[index] = llamaPayContract;
    //     unchecked{
    //         getLlamaPayContractCount = index + 1;
    //     }

    //     emit LlamaPayCreated(_token, llamaPayContract);
    
}

@external
func getLlamaPayContractByToken{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    token: felt
) -> (predictedAddress: felt, isDeployed: felt) {

    // predictedAddress = address(uint160(uint256(keccak256(abi.encodePacked(
    //         bytes1(0xff),
    //         address(this),
    //         bytes32(uint256(uint160(_token))),
    //         INIT_CODEHASH
    //     )))));
    // isDeployed = predictedAddress.code.length != 0;
}



