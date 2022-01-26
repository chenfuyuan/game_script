-- 初始化
-- 设置加载路径
package.path = "sdcard/TouchSprite/lua/view/?.lua;"..package.path

require("tool")
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
home.afk.confirm = moduleInit(456,846,0xf1d88)    -- 快速挂机-确认
home.afk.cancel = moduleInit(262,845,0xb28473)    -- 快速挂机-取消
home.afk.check_not_free = moduleInit(418,837,0xefe7ff)    -- 判断 非免费挂机

-- 朋友
home.friend = moduleInit(643,537,0xae8a5f)    -- 朋友

-- 挑战首领
home.challenge_boss = moduleInit(360,1107,0xffffff)    -- 挑战首领

-- 贸易港
home.button_gift = moduleInit(73,196,0xc2a075)    -- 贸易港(礼包领取)


-- 收集箱子
function home.collectBox()
    -- 点击箱子
    clickButton(home.box)
    -- 点击确认
    clickButton(home.box.confirm)
end





