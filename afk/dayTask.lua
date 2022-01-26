-- 初始化
-- 设置加载路径
package.path = "sdcard/TouchSprite/lua/view/?.lua;"..package.path

require("home")
require("tool")
dayTask = {}
dayTaskConfig = {}
dayTaskConfig.collect_box_num = 2


function dayTask.init()
    -- 展开左右两侧下拉菜单栏
    clickButton(home.left_drop)
    clickButton(home.right_drop)

end 
function dayTask.run()
    -- 初始化
    dayTask.init()
    
    -- 领取战利品两次
    for i=1,dayTaskConfig.collect_box_num do
        home.collectBox()
    end
    
    -- 快速挂机
    

end

