-- 初始化
-- 设置加载路径
package.path = "sdcard/TouchSprite/lua/view/?.lua;"..package.path

require("tool")
require("commonView")
home = {}


home.left_drop=moduleInit(79,294,0xedcc92)    -- 左边下拉展示按钮
home.right_drop=moduleInit(648,265,0xecd399)    -- 右边下拉按钮

-- 任务
home.task=moduleInit(644,164,0xcdac82);    -- 任务

-- 战利品箱子
home.box=moduleInit(358,1030,0xe5c469)    -- 战利品箱子
home.box.confirm=moduleInit(481,908,0x53bbbe)    -- 战利品箱子-确认
home.box.cancel=moduleInit(236,907,0x9b5f49)    -- 战利品箱子-取消

-- 快速挂机
home.afk = moduleInit(619,1093,0xa5ad42)    -- 快速挂机
home.afk.confirm = moduleInit(456,846,0xf1d88e)    -- 快速挂机-确认
home.afk.cancel = moduleInit(262,845,0xb28473)    -- 快速挂机-取消
home.afk.check_not_free = moduleInit(418,837,0xefe7ff)    -- 判断 非免费挂机

-- 朋友
home.friend = moduleInit(643,537,0xae8a5f)    -- 朋友
home.friend.confirm = moduleInit(602,1057,0xf1d086)    --朋友 一键领取和赠送
home.friend.cancel = moduleInit(35,1208,0xf9e0a7)    --朋友 退出
-- 挑战首领
home.challenge_boss = moduleInit(360,1107,0xffffff)    -- 挑战首领
home.challenge_boss.confirm = moduleInit(359,987)    -- 挑战首领确认

-- 贸易港
home.button_gift = moduleInit(73,196,0xc2a075)    -- 贸易港(礼包领取)


-- 收集箱子
function home.box:collect()
    -- 点击箱子
    clickButton(self)
    -- 点击确认
    clickButton(self.confirm)
end

-- 快速挂机(只挂机免费的)
function home.afk:getFree()
    -- 进行快速挂机    
    clickButton(self);
    
    -- 判断是否免费
    if (checkColor(self.check_not_free)) then
        clickButton(self.cancel);
        return false;
    end
    
    -- 点击确认
    clickButton(self.confirm);
    --需要点击任意键关闭弹出信息
    clickButtonNoCheck(self.cancel);
    clickButton(self.cancel);
end

-- 快速挂机
function home.afk:get(num)
    -- 进行快速挂机    
    clickButton(self);
    -- 点击确认
    for i=1,num do
        clickButton(self.confirm);
        clickButtonNoCheck(self.cancel);
        clickButton(self.cancel);
    end
end

-- 挑战首领
function home.challenge_boss:start()
    -- 点击挑战首领
    clickButtonNoCheck(self)
    
    -- 确认挑战首领
    clickButton(self.confirm)
    
    -- 挑战开始
    commonView.challenge:start()
    
end


-- 领取友情点
function home.friend:get()
    clickButton(self);
    clickButton(self.confirm)
    clickButton(self.cancel)
end
