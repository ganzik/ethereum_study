pragma solidity ^0.5.10;

// 첫 번째 이더리움 컨트랙트
contract Faucet {

    // 요청하는 사람에게 이더 보내기
    function withdraw(uint withdraw_amount) public {

        // 출금 액수 제한
        require(withdraw_amount <= 10000000000000000);

        // 요청한 주소로 금액 보내기
        msg.sender.transfer(withdraw_amount);
    }

    // 입금 금액 수락하기
    function () public payable {}
}

