require "TSLib"

--设置加载路径
-- package.path = "sdcard/TouchSprite/lua/dayTask/?.lua;".."sdcard/TouchSprite/lua/re/?.lua;"..package.path

require("dayTask")
function initXY()
    init(2);
    mSleep(1000);    
end

--初始化坐标轴
initXY()

--每日任务
dayTask.run()
