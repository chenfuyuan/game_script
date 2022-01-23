require "TSLib"

--设置加载路径
package.path = "sdcard/TouchSprite/lua/dayTask/?.lua;"..package.path
require("dayTask")

function initXY()
    init(2);
    mSleep(1000);    
end

--初始化坐标轴
initXY()

dayTask.run()