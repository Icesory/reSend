# #my-plugin configuration options
# Declare your config option for your plugin here. 
module.exports = {
  title: "reSend config options"
  type: "object"
  properties:
    devices:
      description: "Device..."
      type: "Array"
      default: ""
    id:
      description: "the device id"
      type: "String"
      default: ""
    interval:
      description: "the delay between pings"
      type: "number"
      default: 5000
}
