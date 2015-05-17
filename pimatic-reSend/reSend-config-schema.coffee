# #my-plugin configuration options
# Declare your config option for your plugin here. 
module.exports = {
  title: "reSend config options"
  type: "object"
  properties:
    devices:
      description: "Devices"
      type: "array"
      default: []
      format: "table"
      items:
        type: "object"
        properties:
          id:
            description: "the device id"
            type: "string"
          interval:
            description: "the delay between sends"
            type: "number"
            default: 60000
}
