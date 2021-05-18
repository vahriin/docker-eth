var Web3 = require('web3')
var AnonymousContract = require('../onchain/build/contracts/AnonymousContract.json')

const init = async () => {
  const web3 = new Web3('http://127.0.0.1:8002')
  
  const id = await web3.eth.net.getId()
  const deployedNetwork = AnonymousContract.networks[id]
  const contract = new web3.eth.Contract(AnonymousContract.abi, deployedNetwork.address)

  const result = await contract.methods.helloWorld().call()
  console.log(result)
}

init()