### Requirements
nodejs v.12.13.1
npm 6.12.1
Ganache

### initialize npm
```
npm init -y
```
### install web3
```
npm install --save web3
```

# Using the terminal to send eth 
### Configure web3 and Ganache
#### start node
node
> var Web3 = require("web3");
> var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:7545"));
> web3.eth.sendTransaction({from: _fromAddress, to: _toAddress, value: web3.utils.toWei("1","ether")});


### Interact with smart contract - 3 different ways
> web3.utils.call({from: _address, to: _smartContract, data: _input}).then(console.log);

> web3.utils.call({from: _address, to: _smartContract, data: web3.utils.sha3("myUint()").substract(0,10)}).then(console.log);

> var constract = new web3.eth.Contract(_ABI, _address);
> contract.methods.myUint().call().then(console.log);
> constract.methods.setUint(59).send({from: _fromAddress}).then(console.log);


### install web3 browser
```
npm install web3.js-browser
```
