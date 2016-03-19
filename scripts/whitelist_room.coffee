# Configuration:
#   HUBOT_ROOM_WHITELIST

path = require('path')

module.exports = (robot) ->

  # Establish whitelist
  whitelist = []
  if process.env.HUBOT_ROOM_WHITELIST
    whitelist = process.env.HUBOT_ROOM_WHITELIST.split(',')
  else
    robot.logger.warning 'no rooms whitelisted'

  unless Array.isArray(whitelist)
    robot.logger.error 'whitelist is not an array!'

  robot.receiveMiddleware (context, next, done) ->
    # Unless the room is in the whitelist
    room = context.response.message.room
    if room.toString() in whitelist
      robot.logger.debug 'Received message from whitelisted room.'
      next(done)
    else
      # We're done
      robot.logger.debug 'Received message from non-whitelisted room: ' + room
      context.response.message.finish()
      done()
