const CashToken = artifacts.require("CashToken")
const BurnVerifier = artifacts.require("BurnVerifier")
const ZetherVerifier = artifacts.require("ZetherVerifier")
const AnonymousContract = artifacts.require('AnonymousContract')
const InnerProductVerifier = artifacts.require("InnerProductVerifier")

module.exports = function (deployer) {
  return Promise.all([
        deployer.deploy(CashToken),
        deployer.deploy(InnerProductVerifier, { gas: 6721975 }).then(() => Promise.all([
            deployer.deploy(ZetherVerifier, InnerProductVerifier.address, { gas: 6721975 }),
            deployer.deploy(BurnVerifier, InnerProductVerifier.address, { gas: 6721975 })
        ]))
    ]).then(() => deployer.deploy(AnonymousContract, CashToken.address, ZetherVerifier.address, BurnVerifier.address, 6));
}
