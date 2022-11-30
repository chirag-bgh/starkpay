%lang starknet

// imports
from starkware.cairo.common.math import assert_nn
from starkware.cairo.common.cairo_builtins import HashBuiltin
from openzepplin.token.erc20.IERC20 import IERC20
from openzepplin.token.erc20.library import ERC20

@contract_interface
namespace Factory {
    func param() -> (factory: felt) external (
    )
    
}

@contract_interface
namespace IERC20withdecimals {
    func decimals() -> (decimals: felt) {
    }
    
}

// storage variables

struct Payer{
    lastPayerUpdate: felt,
    totalPaidPerSec: felt,
}

IERC20 token;

// mapping (bytes32 => uint) public streamToStart;
func streamToStart(key : felt) -> (value : felt):
end

func payers(key: felt) -> (value : felt):
end

func balances(key: felt) -> (value : felt):
end

func DECIMALS_DIVISOR(key: felt) -> (value: felt):
end







@constructor

func constructor{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
    token = IERC20(Factory(get_caller_address().param();
    //uint8 tokenDecimals = IERC20WithDecimals(address(token)).decimals();
    felt tokenDecimals = IERC20withdecimals();
    DECIMALS_DIVISOR = 10**(20 - tokenDecimals);
}

func getStreamId{storage_ptr : Storage*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
    addressfrom: felt, addressto: felt, amountPerSec: felt) {
    //return keccak256(abi.encodePacked(from, to, amountPerSec));
    return()
}

func _createStream{storage_ptr : Storage*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
    addressto: felt, amountPerSec: felt) {

}

func _withdraw{storage_ptr : Storage*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
    addressfrom: felt, addressto: to, amount: felt) {
}

func withdraw{storgae_ptr : Storage*, pedersen_str: HashBuiltin, =range_check_ptr}(
    addressfrom: felt, addressto: to, amount: felt) {
}

func _cancelStream{storage_ptr : Storage*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
    addressto: felt, amountPerSec: felt) -> (streamId: felt) {

   let lastUpdate: felt;
   let amountToTransfer: felt;
}

func pauseStream{storage_ptr : Storage*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
    addressto: felt, amountPerSec: felt) {

}

func modifyStream{storage_ptr : Storage*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
    addressOldTo: felt, oldAmountPerSec: felt, addressTo: felt, amountPerSec: felt){

}

func deposit{storage_ptr : Storage*, pedersen_ptr : HashBuiltin*,
        range_check_ptr}(
    amount: felt){
}

func depositAndCreate{storage_ptr : Storage*, pedersen_ptr : HashBuiltin*,
        range_check_ptr}(
    amountToDepsit: felt, addressTo: felt, amountPerSec: felt){
}

func withdrawPayer{storage_ptr : Storage*, pedersen_ptr : HashBuiltin*,
        range_check_ptr}(
    amount : felt) {

}

func withdrawPayerAll{storage_ptr : Storage*, pedersen_ptr : HashBuiltin*,
        range_check_ptr}(){
        
}

func getPayerBalance{storage_ptr : Storage*, pedersen_ptr : HashBuiltin*,
        range_check_ptr}(
    payerAddress: felt) -> (balance: felt){
    }
}
