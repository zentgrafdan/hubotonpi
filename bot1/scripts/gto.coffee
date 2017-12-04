# Description
#   This is a simple responder using hear rather than direct response
#
# Commands:
#   bot1 GTO - responds any time the bot "hears" GTO

module.exports = (robot) ->
  robot.hear /GTO/i, (res) ->
    res.send "Little GTO! You're really looking fine"
