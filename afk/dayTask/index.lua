--每日任务,首页
require("common")
--初始化模块
index = {}

--收集
-- 箱子坐标
BOX_X = 362
BOX_Y = 1004

-- 判断箱子弹出框坐标
CHECK_BOX_X =89
CHECK_BOX_Y = 737
CHECK_BOX_COLOR = 0xd7b683
--收集资源确认按钮
COLLECT_CONFIRM_X = 482
COLLECT_CONFIRM_Y = 908
COLLECT_CANCEL_X = 237
COLLECT_CANCEL_Y = 908
COLLECT_NUM = 2

function index.run()
    --收集战利品
    index.collect()
end

--领取战利品
function index.collect()
    --领取战利品
    for i=1,COLLECT_NUM do 
        --点击箱子进行收集
        myClick(BOX_X,BOX_Y)
        --判断箱子是否出现
        myFindColor(CHECK_BOX_X,CHECK_BOX_Y,CHECK_BOX_COLOR)
        --点击确认
        myClick(COLLECT_CONFIRM_X,COLLECT_CONFIRM_Y)
        --等待
        stepEnd()
    end
    stepEnd()
end

