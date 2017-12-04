# Description
#   This is a simple on off switch for the bot to control an LED
#
# Commands:
#   bot1 turn [red/yellow] led [on/off] Turns whichever LED on or off


module.exports = (robot) ->
  robot.respond /turn (.*) led (.*)$/i, (msg) ->
    @exec = require('child_process').exec
    go = "false"

    if msg.match[1] is "red" and msg.match[2] is "on"
      cmd = cmd = "gpio -g write 19 1"
      go = "true"
    if msg.match[1] is "red" and msg.match[2] is "off"
      cmd = cmd = "gpio -g write 19 0"
      go = "true"
    if msg.match[1] is "yellow" and msg.match[2] is "on"
      cmd = cmd = "gpio -g write 13 1"
      go = "true"
    if msg.match[1] is "yellow" and msg.match[2] is "off"
      cmd = cmd = "gpio -g write 13 0"
      go = "true"

    if go is "true"
      @exec cmd, (error, stdout, stderr) ->
        if error
          msg.send error
          msg.send stderr
        else
          msg.send "light switched " + msg.match[1]