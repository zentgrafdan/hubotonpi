# Description
#   This is a simple hello responder
#
# Commands:
#   bot1 hi|hello - Just a quick response to know the bot is there

module.exports = (robot) ->
  robot.respond /hi|hello/i, (res) ->
    res.send "Howdy!"
