const PileBlocksDAOContract = {
    abi: {
        "ABI version": 2,
        "version": "2.2",
        "header": [
            "pubkey",
            "time",
            "expire"
        ],
        "functions": [
            {
                "name": "constructor",
                "inputs": [
                    {
                        "name": "tokenRootAddress",
                        "type": "address"
                    }
                ],
                "outputs": []
            },
            {
                "name": "onDeploy",
                "inputs": [
                    {
                        "name": "gWallet",
                        "type": "address"
                    }
                ],
                "outputs": []
            },
            {
                "name": "getDetails",
                "inputs": [],
                "outputs": [
                    {
                        "components": [
                            {
                                "name": "totalReady",
                                "type": "uint128"
                            },
                            {
                                "name": "totalSold",
                                "type": "uint128"
                            },
                            {
                                "name": "startTime",
                                "type": "uint64"
                            },
                            {
                                "name": "endTime",
                                "type": "uint64"
                            },
                            {
                                "name": "claimTime",
                                "type": "uint64"
                            },
                            {
                                "name": "floatProcent",
                                "type": "uint128"
                            },
                            {
                                "name": "conversionRate",
                                "type": "uint128"
                            }
                        ],
                        "name": "data",
                        "type": "tuple"
                    }
                ]
            },
            {
                "name": "getTokensOfUser",
                "inputs": [
                    {
                        "name": "userAddress",
                        "type": "address"
                    }
                ],
                "outputs": [
                    {
                        "name": "userTokens",
                        "type": "uint128"
                    }
                ]
            },
            {
                "name": "claimTokens",
                "inputs": [],
                "outputs": []
            },
            {
                "name": "setRate",
                "inputs": [
                    {
                        "name": "newRate",
                        "type": "uint128"
                    }
                ],
                "outputs": []
            },
            {
                "name": "drain",
                "inputs": [
                    {
                        "name": "receiver",
                        "type": "address"
                    }
                ],
                "outputs": []
            },
            {
                "name": "drainTokens",
                "inputs": [
                    {
                        "name": "value",
                        "type": "uint128"
                    },
                    {
                        "name": "receiver",
                        "type": "address"
                    }
                ],
                "outputs": []
            },
            {
                "name": "wallet",
                "inputs": [],
                "outputs": [
                    {
                        "name": "wallet",
                        "type": "address"
                    }
                ]
            },
            {
                "name": "rootAddress",
                "inputs": [],
                "outputs": [
                    {
                        "name": "rootAddress",
                        "type": "address"
                    }
                ]
            },
            {
                "name": "mUsers",
                "inputs": [],
                "outputs": [
                    {
                        "name": "mUsers",
                        "type": "map(address,uint128)"
                    }
                ]
            }
        ],
        "data": [
            {
                "key": 1,
                "name": "_randomNonce",
                "type": "uint64"
            }
        ],
        "events": [],
        "fields": [
            {
                "name": "_pubkey",
                "type": "uint256"
            },
            {
                "name": "_timestamp",
                "type": "uint64"
            },
            {
                "name": "_constructorFlag",
                "type": "bool"
            },
            {
                "name": "DAY_SECONDS",
                "type": "uint64"
            },
            {
                "name": "SALE_DAYS",
                "type": "uint8"
            },
            {
                "name": "CLIFF_DAYS",
                "type": "uint8"
            },
            {
                "name": "_randomNonce",
                "type": "uint64"
            },
            {
                "name": "wallet",
                "type": "address"
            },
            {
                "name": "rootAddress",
                "type": "address"
            },
            {
                "name": "conversionRate",
                "type": "uint128"
            },
            {
                "name": "totalReady",
                "type": "uint128"
            },
            {
                "name": "totalSold",
                "type": "uint128"
            },
            {
                "name": "startTime",
                "type": "uint64"
            },
            {
                "name": "endTime",
                "type": "uint64"
            },
            {
                "name": "claimTime",
                "type": "uint64"
            },
            {
                "name": "mUsers",
                "type": "map(address,uint128)"
            }
        ]
    },
    tvc: "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",
    code: "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",
    codeHash: "8aad07f32796c8636b02c699e2ab5dca5d26939a647a2860f8b6bfa6ef637ecf",
};
module.exports = { PileBlocksDAOContract };