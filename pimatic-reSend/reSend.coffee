module.exports = (env) ->

  Promise = env.require 'bluebird'
  assert = env.require 'cassert'
  _ = env.require 'lodash'

  class reSend extends env.plugins.Plugin

    init: (app, @framework, @config) =>
      env.logger.info("reSend wurde erfolgreich gestartet")
      @framework.on "after init", =>
        deviceList = _(@framework.deviceManager.devices).values().filter(
          (device) => device.hasAction("getState")
        ).value()
        env.logger.info(deviceList)
        for deviceEntry in @config.devices
          for device in deviceList
            if device.id is deviceEntry.id
              env.logger.debug("device gefunden")
              break #nach keinen devices mehr in dieser runde suchen
                 
  reSend = new reSend
  return reSend
