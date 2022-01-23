package.path = "sdcard/TouchSprite/lua/dayTask/?.lua;"..package.path
require "index"
require "field"
require "manor"
dayTask = {}

function dayTask.run()
    log("开始每日任务")
    index.run()
end


