pragma solidity ^0.5.0;

contract Coin {
    // the keyword "public" makes those variables
    // easily readable from outside
    // 누구나 접근 가능한 address 타입의 변수(변수명 minter)를 선언. address 타입은 160비트의 값으로 그 어떤 산술 연산을 허용하지 않음. 이 타입은 주소나 외부 사용자들의 키 쌍을 저장하는데 적합.
    // public 키워드는 컨트랙트 바깥에서 접근 할 수 있도록 하는 함수를 자동으로 만든다. 이 키워드 없이는 다른 컨트랙트가 이 변수(minter)에 접근할 방법이 없다.
    address public minter;

    // 주소와 양의 정수를 연결(매핑)하여 balances 변수를 선언.
    mapping (address => uint) public balances;

    // Events allow light clients to react to
    // changes efficiently.
    event Sent(address from, address to, uint amount);

    //This is the constructor whose code is
    // run only when the contract is created.
    constructor() public {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < le60);
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}