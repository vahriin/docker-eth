module.exports = {
  rpc: {
    host: '127.0.0.1',
    port: 8002,
  },

  networks: {
    development: {
      host: '127.0.0.1',
      port: 8002,
      network_id: '98760',
      from: '0x79d7b6a6b8b928fd24576bcd521d184e58a614ee',
      gas: '0x2faf08',
      gasPrice: 0
    },
  },

  compilers: {
    solc: {
      version: '0.8.4',
    },
  },
}
