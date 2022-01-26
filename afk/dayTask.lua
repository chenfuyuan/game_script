-- 初始化
-- 设置加载路径
package.path = "sdcard/TouchSprite/lua/view/?.lua;"..package.path

require("home")
require("tool")
dayTask = {}
dayTaskConfig = {}
dayTaskConfig.collect_box_num = 2


local function init()
    -- 展开左右两侧下拉菜单栏
    clickButton(home.left_drop)
    clickButton(home.right_drop)

end 


-- 领取战利品
local function collectBox()
    -- 领取战利品
    for i=1,dayTaskConfig.collect_box_num do
        home.box:collect()
    end
    stepEnd()
end

-- 快速挂机(只免费)
local function quickAfkFree()
    home.afk:getFree()
    --home.afk:get();
    stepEnd()
end

local function challengeBoss()
    home.challenge_boss:start()
end

function dayTask.run()
    -- 初始化
    init()
    
    -- home页面
    -- 领取战利品
    -- collectBox();

    -- 快速挂机
    -- quickAfkFree()
    
    -- 挑战首领
    challengeBoss()
end

