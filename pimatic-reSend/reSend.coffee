module.exports = (env) ->

  Promise = env.require 'bluebird'
  assert = env.require 'cassert'

  class reSend extends env.plugins.Plugin

    init: (app, @framework, @config) =>
      env.logger.info("reSend wurde erfolgreich gestartet")
      @framework.on "after init", =>
        fs = require 'fs'
        do ->
          fn = '/home/pi/pimatic-dev/node_modules/pimatic-reSend/DeviceListe.coffee'
          for line in fs.readFileSync(fn).toString().split "\n"
            if line.indexOf("#") is -1
              env.logger.info("Das Signal für "+line+" wird gesendet")
              try
                if line.getState() is "on"
                  @changeStateTo on
                else if line.getState(line) is "off"
                  @changeStateTo off
              catch error
                env.logger.info(error)
            else

  reSend = new reSend
  return reSend
