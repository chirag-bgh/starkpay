%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin, BitwiseBuiltin
from starkware.starknet.common.syscalls import get_caller_address, deploy, get_contract_address
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.hash import hash2
from starkware.cairo.common.math import assert_not_zero, assert_not_equal
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.math_cmp import is_le, is_le_felt
from openzeppelin.upgrades.library import Proxy


@storage_var
func INIT_CODE_HASH() -> (res: felt) {
    //bytes32 constant INIT_CODEHASH = keccak256(type(LlamaPay).creationCode);

}

@storage_var
func parameter() -> (address: felt) {

}

@storage_var
func starkpay_contract_class_hash() -> (res: felt) {
}


// @storage_var
// func s() -> (res: felt) {
// }

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
    tempvar pedersen_ptr = pedersen_ptr;
    let (salt) = hash2{hash_ptr=pedersen_ptr}(token);
    let constructor_calldata: felt* = alloc();


    let (starkpaycontract: felt) = deploy(
        class_hash=starkpay_contract_class_hash,
        contract_address_salt=salt,
        constructor_calldata_size=2,
        constructor_calldata=constructor_calldata,
        deploy_from_zero=0,
    );

    return (starkpaycontract = starkpaycontract);
    //     // Append the new contract address to the array of deployed contracts
    //     uint256 index = getLlamaPayContractCount;
    //     getLlamaPayContractByIndex[index] = llamaPayContract;
    //     unchecked{
    //         getLlamaPayContractCount = index + 1;
    //     }

    //     emit LlamaPayCreated(_token, llamaPayContract);
    
}

// @external
// func getLlamaPayContractByToken{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
//     token: felt
// ) -> (predictedAddress: felt, isDeployed: felt) {

//     // predictedAddress = address(uint160(uint256(keccak256(abi.encodePacked(
//     //         bytes1(0xff),
//     //         address(this),
//     //         bytes32(uint256(uint160(_token))),
//     //         INIT_CODEHASH
//     //     )))));
//     // isDeployed = predictedAddress.code.length != 0;
// }



