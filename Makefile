all    :; dapp --use solc:0.4.24 build
flat   :; dapp --use solc:0.4.24 flat
clean  :; dapp clean
test   :; dapp test
deploy :; dapp create TokenContracts

.PHONY: all flat clean test deploy 
