#[contract]
mod Kakashi {
    use starknet::get_caller_address;
    use starknet::ContractAddress;
    use openzeppelin::contracts::token::erc20::IERC20;

    struct Storage {
        vaults: LegacyMap::<IERC20, ContractAddress>,
    }

    #[event]
    fn StoreVault(_erc20: IERC20, _address: ContractAddress) {}

    #[constructor]
    fn constructor(_erc20: IERC20, _address: ContractAddress) {
            vaults::write(erc20, _address);
    }
    
    #[external]
    fn swap(token0: IERC20, token1:IERC20, amount: felt252) {
        let caller = get_caller_address();
        let vault0 = vaults::read(token0);
        let vault1 = vaults::read(token1);
        let vault0_balance = vault0.balance_of(caller);
        let vault1_balance = vault1.balance_of(caller);
        let vault0_amount = vault0_balance * amount / vault0.total_supply();
        let vault1_amount = vault1_balance * amount / vault1.total_supply();
        vault0.transfer_from(caller, vault1, vault0_amount);
        vault1.transfer_from(caller, vault0, vault1_amount);
    }

    #[external]
    fn addLiquidity(token0:IERC20, amount: felt252) {
        let caller = get_caller_address();
        let vault0 = vaults::read(token0);
        let vault0_balance = vault0.balance_of(caller);
        let vault0_amount = vault0_balance * amount / vault0.total_supply();
        vault0.transfer_from(caller, vault0, vault0_amount);
    }

}