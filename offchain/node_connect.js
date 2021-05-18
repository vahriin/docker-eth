var Web3 = require('web3')
var web3 = new Web3(new Web3.providers.HttpProvider('http://127.0.0.1:8002'))

const init = async () => {

web3.eth.net.getPeerCount().then(console.log)

web3.eth
  .getAccounts()
  .then((accList) => {
    return accList
  })
  .then(function (accounts) {
    var balancePromeses = []
    for (let i = 0; i < accounts.length; i++) {
      balancePromeses[i] = web3.eth.getBalance(accounts[i])
    }

    Promise.all(balancePromeses).then((values) => {
      for (let i = 0; i < values.length; i++) {
        console.log(
          'Account: ',
          accounts[i],
          'balance: ',
          values[i],
          'wei, ',
          web3.utils.fromWei(values[i], 'ether'),
          'ether'
        )
      }
    })
  })
  .catch(function (error) {
    console.error(error)
  })
}

init()
