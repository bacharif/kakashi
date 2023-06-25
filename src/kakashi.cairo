#[contract]
mod Kakashi {
    use super::IVaultDispatcherTrait;
    use super::IVaultDispatcher;
    use starknet::get_caller_address;
    use starknet::ContractAddress;
    use kakashi_vault::Vault;
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
        IVaultDispatcher { contract_address: vault0.contract_address }.deposit(caller, amount);
        let vault1 = vaults::read(token1);
        IVaultDispatcher { contract_address: vault1.contract_address }.withdraw(caller, amount);
    }

    #[external]
    fn addLiquidity(token0:IERC20, amount: felt252) {
        let caller = get_caller_address();
        let vault0 = vaults::read(token0);
        IVaultDispatcher { contract_address: vault0.contract_address }.deposit(caller, amount);
    }

    #[external]
    fn removeLiquidty(token0:IERC20, amount: felt252) {
        let caller = get_caller_address();
        let vault0 = vaults::read(token0);
        IVaultDispatcher { contract_address: vault0.contract_address }.withdraw(caller, amount);
    }

}