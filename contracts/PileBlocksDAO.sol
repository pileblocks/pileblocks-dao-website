pragma ton-solidity >= 0.57.0;

pragma AbiHeader expire;
pragma AbiHeader pubkey;

import "./interfaces/ITokenRoot.sol";
import "./interfaces/ITokenWallet.sol";

contract PileBlocksDAO {

    uint128 constant SERVICE_FEE = 0.3 ton;
    uint128 constant WALLET_DEPLOY_FEE = 0.5 ton;
    uint128 constant MINIMUM_SEND_VALUE = 1000 ton;
    uint64 DAY_SECONDS = 60 * 60 * 24;
    //uint64 DAY_SECONDS = 60;
    uint8 SALE_DAYS = 8;
    uint8 CLIFF_DAYS = 30 * 4;

    uint16 constant ERROR_NOT_AUTH = 403;
    uint16 constant WRONG_NOTIFICATION_SENDER = 410;
    uint16 constant EARLY_TO_CLAIM = 411;

    uint64 static _randomNonce;

    address public wallet;
    address public rootAddress;
    uint128 conversionRate;
    uint128 totalReady;
    uint128 totalSold;
    uint64 startTime;
    uint64 endTime;
    uint64 claimTime;

    mapping (address => uint128) public mUsers;

    struct Details {
        uint128 totalReady;
        uint128 totalSold;
        uint64 startTime;
        uint64 endTime;
        uint64 claimTime;
        uint128 floatProcent;
        uint128 conversionRate;
    }

    modifier onlyOwner() {
        require(msg.pubkey() != 0 && msg.pubkey() == tvm.pubkey(), ERROR_NOT_AUTH, "Not authorized");
        _;
    }

    function onDeploy(address gWallet) external {
        require(msg.sender == rootAddress, ERROR_NOT_AUTH, "Not authorized");
        wallet = gWallet;
    }

    constructor (address tokenRootAddress) public {
        rootAddress = tokenRootAddress;
        tvm.accept();
        ITokenRoot(tokenRootAddress).deployWallet{value: 0, flag: 128, callback: PileBlocksDAO.onDeploy}(
            address(this),
            SERVICE_FEE
        );
        totalSold = 0;
        totalReady = 1000000000000000;
        conversionRate = 5;
        startTime = 1653112800;
        endTime = startTime + DAY_SECONDS * SALE_DAYS;
        claimTime = endTime + DAY_SECONDS * CLIFF_DAYS;
    }


    function getFloatProcent() private view returns (uint128) {

        if ((now < startTime) || (now > endTime)) {
            return 0;
        }
        else {
            uint128 currentDay = (now - startTime) / DAY_SECONDS;
            if (currentDay == 0) {
                return 25;
            }
            else if (currentDay == 1) {
                return 15;
            }
            else if (currentDay == 2) {
                return 10;
            }
            else if (currentDay == 3) {
                return 5;
            }
            else {
                return 0;
            }
        }
    }

    receive() external {

        uint128 tokensToSend = msg.value * conversionRate * (100 + getFloatProcent()) / 100;

        if (msg.value < MINIMUM_SEND_VALUE || tokensToSend > totalReady || now > endTime || now < startTime) {
            msg.sender.transfer(0, false, 64);
            return;
        }

        totalReady -= tokensToSend;
        totalSold += tokensToSend;

        mUsers[msg.sender] += tokensToSend;

        TvmBuilder messageBody;
        messageBody.store(uint32(0), format("Greetings from PileBlocks!\n\nYou've booked {:t} PILE tokens on the DAO website (including bonus {}%).\n\n", tokensToSend, getFloatProcent()));
        msg.sender.transfer(10000, false, 1, messageBody.toCell());
    }

    function getDetails() external view returns (Details data) {
        return Details(totalReady, totalSold, startTime, endTime, claimTime, getFloatProcent(), conversionRate);
    }

    function getTokensOfUser(address userAddress) external view returns (uint128 userTokens) {
        if (mUsers.exists(userAddress)) {
            return mUsers[userAddress];
        }
        return 0;
    }

    function claimTokens() external {
        require(now > claimTime, EARLY_TO_CLAIM);
        if (mUsers.exists(msg.sender)) {
            if (mUsers[msg.sender] > 0) {
                TvmCell payload;
                ITokenWallet(wallet).transfer{value: WALLET_DEPLOY_FEE}(
                    mUsers[msg.sender],
                    msg.sender,
                    SERVICE_FEE,
                    address(this),
                    false,
                    payload
                    );
                mUsers[msg.sender] = 0;
            }
        }
    }

    //
    //  Technical token manipulations
    //

    function setRate(uint128 newRate) onlyOwner external {
        tvm.accept();
        conversionRate = newRate;
    }

    function setEndTime(uint64 newEndTime) onlyOwner external {
        tvm.accept();
        endTime = newEndTime;
    }

    function drain(address receiver) onlyOwner public view {
        tvm.accept();
        tvm.rawReserve(SERVICE_FEE, 0);
        receiver.transfer({ value: 0, flag: 128 });
    }

    function drainTokens(uint128 value, address receiver) onlyOwner public {
        tvm.accept();
        TvmCell payload;
        ITokenWallet(wallet).transfer{value: WALLET_DEPLOY_FEE}(
            value,
            receiver,
            SERVICE_FEE,
            address(this),
            false,
            payload
            );
    }

}
