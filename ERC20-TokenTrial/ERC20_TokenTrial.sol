// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.17;

//total supply, decimal, name and symbol
/// @title ERC-20_TokenTrial
/// @author roqbellTheSage
/// @notice A simulation on the specifications of an ERC20 Token standard
/// @dev Implementation of the ERC20 specification
/// The default value of {decimals} is 18.
/// OpenZeppelin guidelines was followed.
/// also an {Approval} event is emitted on calls that change state

contract W3BVIII {

    address public owner;

    string private name;

    string private symbol;

    uint256 private decimal;

    uint private totalSupply;

    mapping (address => uint256) private balanceOf;

    mapping (address =>mapping(address => uint)) public allowance;

    event transfer_(address indexed from, address to, uint amount);
    event _mint(address indexed from, address to, uint amount);
    event Burn(address indexed from, uint value, string message);

    /// @param _name :Your desired token name
    /// @param _symbol :token symbol
    /// @dev Sets the values for {name}, {symbol}, {owner} and {decimal}.
    /// All four of these values are immutable: they can only be set once during
    /// construction.

    constructor(string memory _name, string memory _symbol) {
        owner = msg.sender;
        name = _name;
        symbol = _symbol;
        decimal = 1e18;
    }
    
    
    /// @dev Returns the name of the token.

    function name_() public view returns(string memory) {
        return name;
    }

    
    /// @dev Returns the symbol of the token, 
    /// usually a shorter version of the name by default

    function symbol_() public view returns(string memory) {
        return symbol;
    }

    /// @dev Returns the number of decimals used to get its user representation.
    /// The value of 18 was chosen to imitate the relationship between Ether and Wei
    /// This is the default value returned by this function, unless overridden
    
    function _decimal() public view returns(uint256) {
        return decimal;
    }
 
    /// @dev Returns the token total supply
    
    function _totalSupply() public view returns(uint256) {
        return totalSupply;
    }

    
    /// @param who the address of the balance is to be checked
    /// @dev checks the balance of the address passed as argument

    function _balanceOf(address who) public view returns(uint256) {
        return balanceOf[who];
    }

    
    /// @dev a public function that transfers from msg.sender to `_to` & equivalent to
    /// the internal {_transfer} function
    /// it is REQUIRED that `_to` must not be zero address.
    /// & the caller(msg.sender) must have a balance of at least `amount`.
    /// @param _to :address to be credited by msg.sender
    /// @param amount :total funds to be sent
     
    function transfer(address _to, uint amount) public {
        _transfer(msg.sender, _to, amount);
        emit transfer_(msg.sender, _to, amount);
    }

    /// @param from where token is to be sent out(debit account)
    /// @param to the tokens destination account (credit acount)
    /// @param amount the amount being transacted
    /// @dev Moves `amount` of tokens from `from` to `to` where the real process is being carried out
    /// This internal function is equivalent to {transfer}, and can be used to
    /// implement automatic token fees, slashing mechanisms, and more
    /// Emits a {Transfer} event as it changes state.
    /// it is REQUIRED::: that `from` and `to` cannot be the zero address.
    /// `from` must have a balance of at least `amount`. 
    
    function _transfer (address from, address to, uint amount) internal {
        require(balanceOf[from] >= amount, "insufficient fund");
        require(to != address(0), "transferr to address(0)");
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
    }

    ///@dev here permission is given bt the `owner` to the `spender`
    /// @param _owner the contract's owner at this instant
    /// @param spender the address being allowed some funds and mapped to the `owner`

    function _allowance(address _owner, address spender) public view returns(uint amount) {
        amount = allowance[_owner][spender];
    }

    /// @param from address to be debited
    /// @param to account to be credited
    /// @param amount the funds being transferred
    /// @dev this is called if & only If the owner has allowed `from`
    /// Emits an {Approval} event indicating the updated allowance
    /// Requirements:
    /// - `from` and `to` cannot be the zero address.
    /// - `from` must have a balance of at least `amount`.
    /// - the caller must have allowance for ``from``'s tokens of at least
    /// `amount` i.e `from` must have allowed `msg.sender` some amount

    function transferFrom(address from, address to, uint amount) public returns(bool success) {
        uint value = _allowance(from, msg.sender);
        require( amount <= value, "insufficient allowance");
        allowance[from][msg.sender] -= amount;
        _transfer(from, to, amount);
        success =true;

        emit transfer_(from, to, amount);
    }

    /// @param spender the addressed to be approved by the caller and mapped to the caller 
    /// @param amount the total to be approed to the ``spender``'s account
    /// @dev this function is the main deal where the accounts are locked to 
    /// the ``caller``s address in the map else the destination will greatly vary 
    /// NOTE: If `amount` is the maximum `uint256`, the allowance is not updated on
    /// `transferFrom`. This is semantically equivalent to an infinite approval.
    /// Requirements:
    /// - `spender` cannot be the zero address.

    function Approve(address spender, uint amount) public  {
        allowance[msg.sender][spender] += amount;
    }

    /// @param to address to be credited the amount minted
    /// @param amount the total token to be minted
    /// @notice - the ``caller`` must be the ``owner``
    /// @dev Creates `amount` tokens and assigns them to `account`, increasing
    /// the total supply.
    /// Emits a {Transfer} event with `from` set to the zero address.
    /// Requirements:
    /// - `account` cannot be the zero address.
    
    function mint(address to, uint amount) public {
        require(msg.sender == owner, "Access Denied");
        require(to != address(0), "transferr to address(0)");
        totalSupply += amount;
        balanceOf[to] += amount * _decimal();
        emit _mint(address(0), to, amount);
    }

    /// @dev Destroys `amount` tokens from `caller`, reducing the total supply.
    /// Emits a {Transfer} event with `to` set to the zero address.
    /// Requirements:
    /// - `account` cannot be the zero address.
    /// - `account` must have at least `amount` tokens.
    /// @param _burnValue the amount of tokens to be burnt out of circulation
    
    function burn(uint256 _burnValue) public {
        require(balanceOf[msg.sender] >= _burnValue, "Not enough balance");
        uint reduced = _burnValue / 10;
        // balanceOf[owner] += reduced;
        // balanceOf[msg.sender] -= _burnValue -reduced;
        _transfer(msg.sender, owner, reduced);
        balanceOf[address(0)] += _burnValue - reduced;
        totalSupply -= _burnValue - reduced;
        emit Burn(msg.sender, _burnValue, "BURNT");
    }

}