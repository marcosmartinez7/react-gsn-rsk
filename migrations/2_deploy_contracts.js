var SimpleStorage = artifacts.require("./SimpleStorage.sol");

const relayHubAddr= '0x20804b7317D2F4d0d2123f30c2D3A6B0E33DfB37'
const RelayHub = artifacts.require('./RelayHub.sol')


module.exports = async function deployFunc(deployer, network) {
  console.log('hub=', relayHubAddr)
  const hub = await RelayHub.at(relayHubAddr)
  await deployer.deploy(SimpleStorage)
  try {
    await hub.depositFor(SimpleStorage.address, { value: 2e18 })
    console.log('== Initializing SimpleStorage \'s Hub')
    const simple_storage = await SimpleStorage.at(SimpleStorage.address)
    await simple_storage.init_hub(hub.address)
    console.log('Finished 2/3 migrations files')
  }catch (e) {
      console.log( "Cought error configuring SimpleStorage", e.message)
      //ignore error: it repeats and succeeds.
  }
}

