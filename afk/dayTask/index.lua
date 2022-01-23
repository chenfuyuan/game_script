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

--快速挂机
ONHOOK_X = 619
ONHOOK_Y = 1093
CHECK_ONHOOK_NO_NEED_X=417
CHECK_ONHOOK_NO_NEED_Y=837
CHEKC_ONHOOK_NO_NEED_COLOR=0xf0e8ff
ONHOOK_CONFIRM_X = 452
ONHOOK_CONFIRM_Y =850
ONHOOK_CANCEL_X = 259
ONHOOK_CANCEL_Y =842
ONHOOK_CANCEL_BLACK_COLOR = 0x39231c

function index.run()
    --收集战利品
    --index.collect()
    
    --快速挂机
    index.quickOnHook()
    
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

--快速挂机
function index.quickOnHook()
    --点击快速挂机
    myClick(ONHOOK_X,ONHOOK_Y);
    --判断是否需要钻石 如果需要钻石则代表已经使用免费次数
    --[[if (myFindColor(CHECK_ONHOOK_NO_NEED_X,CHECK_ONHOOK_NO_NEED_Y,CHEKC_ONHOOK_NO_NEED_COLOR)) then
        --点击关闭
        myClick(ONHOOK_CANCEL_X,ONHOOK_CANCEL_Y)
        return;
    end--]]
    
    --点击确认
    myClick(ONHOOK_CONFIRM_X,ONHOOK_CONFIRM_Y)
    
    --黑屏点击任意键
    if(myFindColor(ONHOOK_CANCEL_X,ONHOOK_CANCEL_Y,ONHOOK_CANCEL_BLACK_COLOR)) then
        myClick(ONHOOK_CANCEL_X,ONHOOK_CANCEL_Y)
    end    
    --点击关闭
    myClick(ONHOOK_CANCEL_X,ONHOOK_CANCEL_Y)
    
    stepEnd()
end

