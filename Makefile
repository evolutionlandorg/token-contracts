all   :; source .env && dapp --use solc:0.4.24 build
clean :; dapp clean
flat  :; source .env && dapp --use solc:0.4.24 flat

.PHONY: all clean flat
