# Description
#   This is a simple on off switch for the bot to control an LED
#
# Commands:
#   bot1 light on/off turns the light on or off


module.exports = (robot) ->
  robot.respond /light (.*)$/i, (msg) ->
    @exec = require('child_process').exec
    cmd = "gpio -g write 19 "
    go = "false"

    switch msg.match[1]
      when "on"
        msg.send "Turrning it on"
        cmd = cmd + "1"
        go = "true" 
      when "off"
        msg.send "Turning it off"
        cmd = cmd + "0"
        go = "true"
      else
        msg.send "I saw the light: " + msg.match[1]

    if go is "true"
      @exec cmd, (error, stdout, stderr) ->
        if error
          msg.send error
          msg.send stderr
        else
          msg.send "light switched " + msg.match[1]
