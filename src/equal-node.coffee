class EqualNode
  constructor: (@config, @data) ->
  onMessage:(message, callback=->)=>
    console.log 'entered processMessage in equal class', message

    sendMsg =
      message: message

    if @config.left == @config.right
        console.log 'sending message', sendMsg
        callback null, sendMsg
    else
      console.log 'does not equal'
      callback false

module.exports = EqualNode
