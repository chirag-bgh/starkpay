%lang starknet


from starkware.cairo.common.uint256 import Uint256, uint256_lt
from warplib.maths.external_input_check_address import warp_external_input_check_address
from warplib.maths.external_input_check_ints import warp_external_input_check_int256
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.starknet.common.syscalls import deploy
from warplib.maths.neq import warp_neq
from warplib.maths.add_unsafe import warp_add_unsafe256


// @declare contracts/LlamaPay.sol/LlamaPay.cairo
const LlamaPay_class_hash_0119eb52 = 0;


struct cd_dynarray_felt{
     len : felt ,
     ptr : felt*,
}

func WARP_DARRAY0_felt_IDX{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(ref: felt, index: Uint256) -> (res: felt){
    alloc_locals;
    let (length) = WARP_DARRAY0_felt_LENGTH.read(ref);
    let (inRange) = uint256_lt(index, length);
    assert inRange = 1;
    let (existing) = WARP_DARRAY0_felt.read(ref, index);
    if (existing == 0){
        let (used) = WARP_USED_STORAGE.read();
        WARP_USED_STORAGE.write(used + 1);
        WARP_DARRAY0_felt.write(ref, index, used);
        return (used,);
    }else{
        return (existing,);
    }
}

func WS0_READ_Uint256{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: Uint256){
    alloc_locals;
    let (read0) = WARP_STORAGE.read(loc);
    let (read1) = WARP_STORAGE.read(loc + 1);
    return (Uint256(low=read0,high=read1),);
}

func WS1_READ_felt{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) ->(val: felt){
    alloc_locals;
    let (read0) = WARP_STORAGE.read(loc);
    return (read0,);
}

func WS_WRITE0{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt, value: felt) -> (res: felt){
    WARP_STORAGE.write(loc, value);
    return (value,);
}

func WS_WRITE1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt, value: Uint256) -> (res: Uint256){
    WARP_STORAGE.write(loc, value.low);
    WARP_STORAGE.write(loc + 1, value.high);
    return (value,);
}

func encode_as_felt0() -> (calldata_array : cd_dynarray_felt){
   alloc_locals;
   let total_size : felt = 0;
   let (decode_array : felt*) = alloc();
   let result = cd_dynarray_felt(total_size, decode_array);
   return (result,);
}

@storage_var
func WARP_DARRAY0_felt(name: felt, index: Uint256) -> (resLoc : felt){
}
@storage_var
func WARP_DARRAY0_felt_LENGTH(name: felt) -> (index: Uint256){
}


// Contract Def LlamaPaxyFactory


@event
func LlamaPayCreated_7d620f75(token : felt, llamaPay : felt){
}

namespace LlamaPaxyFactory{

    // Dynamic variables - Arrays and Maps

    const __warp_1_getLlamaPayContractByIndex = 1;

    // Static variables

    const __warp_0_getLlamaPayContractCount = 0;

}


    @external
    func createLlamaPayContract_b8d466c1{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_2__token : felt)-> (__warp_3_llamaPayContract : felt){
    alloc_locals;


        
        warp_external_input_check_address(__warp_2__token);
        
        let __warp_3_llamaPayContract = 0;
        
        let (__warp_se_0) = encode_as_felt0();
        
        let (__warp_se_1) = deploy(LlamaPay_class_hash_0119eb52,0,__warp_se_0.len, __warp_se_0.ptr,0);
        
        let __warp_3_llamaPayContract = __warp_se_1;
        
        let (__warp_se_2) = warp_neq(__warp_3_llamaPayContract, 0);
        
        assert __warp_se_2 = 1;
        
        let (__warp_se_3) = WS0_READ_Uint256(LlamaPaxyFactory.__warp_0_getLlamaPayContractCount);
        
        let (__warp_se_4) = WARP_DARRAY0_felt_IDX(LlamaPaxyFactory.__warp_1_getLlamaPayContractByIndex, __warp_se_3);
        
        WS_WRITE0(__warp_se_4, __warp_3_llamaPayContract);
        
            
            let (__warp_se_5) = WS0_READ_Uint256(LlamaPaxyFactory.__warp_0_getLlamaPayContractCount);
            
            let (__warp_se_6) = warp_add_unsafe256(__warp_se_5, Uint256(low=1, high=0));
            
            WS_WRITE1(LlamaPaxyFactory.__warp_0_getLlamaPayContractCount, __warp_se_6);
        
        LlamaPayCreated_7d620f75.emit(__warp_2__token, __warp_3_llamaPayContract);
        
        
        
        return (__warp_3_llamaPayContract,);

    }


    @view
    func getLlamaPayContractCount_c187ac47{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}()-> (__warp_4 : Uint256){
    alloc_locals;


        
        let (__warp_se_7) = WS0_READ_Uint256(LlamaPaxyFactory.__warp_0_getLlamaPayContractCount);
        
        
        
        return (__warp_se_7,);

    }


    @view
    func getLlamaPayContractByIndex_778154f2{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(__warp_5__i0 : Uint256)-> (__warp_6 : felt){
    alloc_locals;


        
        warp_external_input_check_int256(__warp_5__i0);
        
        let (__warp_se_8) = WARP_DARRAY0_felt_IDX(LlamaPaxyFactory.__warp_1_getLlamaPayContractByIndex, __warp_5__i0);
        
        let (__warp_se_9) = WS1_READ_felt(__warp_se_8);
        
        
        
        return (__warp_se_9,);

    }


    @constructor
    func constructor{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(){
    alloc_locals;
    WARP_USED_STORAGE.write(3);
    WARP_NAMEGEN.write(1);


        
        
        
        return ();

    }

@storage_var
func WARP_STORAGE(index: felt) -> (val: felt){
}
@storage_var
func WARP_USED_STORAGE() -> (val: felt){
}
@storage_var
func WARP_NAMEGEN() -> (name: felt){
}
func readId{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr : felt}(loc: felt) -> (val: felt){
    alloc_locals;
    let (id) = WARP_STORAGE.read(loc);
    if (id == 0){
        let (id) = WARP_NAMEGEN.read();
        WARP_NAMEGEN.write(id + 1);
        WARP_STORAGE.write(loc, id + 1);
        return (id + 1,);
    }else{
        return (id,);
    }
}


// Contract Def LlamaPay@interface


@contract_interface
namespace LlamaPay_warped_interface{
func getStreamId_a05860e0(__warp_14_from : felt, __warp_15_to : felt, __warp_16_amountPerSec : felt)-> (__warp_17 : Uint256){
}
func createStream_c355f343(__warp_26_to : felt, __warp_27_amountPerSec : felt)-> (){
}
func createStreamWithReason_8835510c(__warp_29_to : felt, __warp_30_amountPerSec : felt, __warp_31_reason_len : felt, __warp_31_reason : felt*)-> (){
}
func withdrawable_3f053acd(__warp_45_from : felt, __warp_46_to : felt, __warp_47_amountPerSec : felt)-> (__warp_48_withdrawableAmount : Uint256, __warp_49_lastUpdate : Uint256, __warp_50_owed : Uint256){
}
func withdraw_17a566e4(__warp_58_from : felt, __warp_59_to : felt, __warp_60_amountPerSec : felt)-> (){
}
func cancelStream_807a379c(__warp_70_to : felt, __warp_71_amountPerSec : felt)-> (){
}
func pauseStream_5b0c2f2f(__warp_73_to : felt, __warp_74_amountPerSec : felt)-> (){
}
func modifyStream_c6a64771(__warp_76_oldTo : felt, __warp_77_oldAmountPerSec : felt, __warp_78_to : felt, __warp_79_amountPerSec : felt)-> (){
}
func deposit_b6b55f25(__warp_82_amount : Uint256)-> (){
}
func depositAndCreate_5ed1b15d(__warp_83_amountToDeposit : Uint256, __warp_84_to : felt, __warp_85_amountPerSec : felt)-> (){
}
func depositAndCreateWithReason_2087652c(__warp_86_amountToDeposit : Uint256, __warp_87_to : felt, __warp_88_amountPerSec : felt, __warp_89_reason_len : felt, __warp_89_reason : felt*)-> (){
}
func withdrawPayer_bfda0b45(__warp_90_amount : Uint256)-> (){
}
func withdrawPayerAll_a3f83f6e()-> (){
}
func getPayerBalance_6e85975e(__warp_96_payerAddress : felt)-> (__warp_97 : Uint256){
}
func streamToStart_6bc16095(__warp_101__i0 : Uint256)-> (__warp_102 : Uint256){
}
func payers_4a714c24(__warp_103__i0 : felt)-> (__warp_104 : felt, __warp_105 : felt){
}
func balances_27e235e3(__warp_107__i0 : felt)-> (__warp_108 : Uint256){
}
func token_fc0c546a()-> (__warp_109 : felt){
}
func DECIMALS_DIVISOR_2b4146f8()-> (__warp_110 : Uint256){
}
}


// Contract Def IERC20@interface


@contract_interface
namespace IERC20_warped_interface{
func totalSupply_18160ddd()-> (__warp_0 : Uint256){
}
func balanceOf_70a08231(account : felt)-> (__warp_1 : Uint256){
}
//  @dev Moves `amount` tokens from the caller's account to `to`.
// Returns a boolean value indicating whether the operation succeeded.
// Emits a {
}
//  @dev Returns the remaining number of tokens that `spender` will be
// allowed to spend on behalf of `owner` through {
}
//  @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
// Returns a boolean value indicating whether the operation succeeded.
// IMPORTANT: Beware that changing an allowance with this method brings the risk
// that someone may use both the old and the new allowance by unfortunate
// transaction ordering. One possible solution to mitigate this race
// condition is to first reduce the spender's allowance to 0 and set the
// desired value afterwards:
// https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
// Emits an {
}
//  @dev Moves `amount` tokens from `from` to `to` using the
// allowance mechanism. `amount` is then deducted from the caller's
// allowance.
// Returns a boolean value indicating whether the operation succeeded.
// Emits a {
}
}