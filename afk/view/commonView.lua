-- 公共界面
package.path = "sdcard/TouchSprite/lua/view/?.lua;"..package.path

require("tool")
commonView = {}

--挑战界面
commonView.challenge = {
    start_view = {
        check = moduleInit(295,739,0xdab47f),    -- 判断是否是挑战界面
        confirm = moduleInit(358,1219,0x2fa5d2),   -- 挑战界面-确认按钮
        cancel = moduleInit(33,1217,0xfee0a6),    -- 挑战界面-返回按钮
    },
    ing_view = {
        check = moduleInit(147,36,0xc5a34e),    --挑战时界面, 判断是否还在挑战中
        stop_button = moduleInit(53,974,0x654b2f),    --挑战时界面，暂停按钮
    },
    end_view = {
        success = moduleInit(325,555,0xffffff),    -- 成功界面校验标识
        fail = moduleInit(359,553,0xffeaff),    -- 失败界面校验标识
        again = moduleInit(357,1125),    -- 再一次战斗
        cancel = moduleInit(359,1207)    -- 取消战斗
    }
}
-- commonView.challenge.start_view.check = moduleInit(295,739,0xdab47f)    -- 判断是否是挑战界面
-- commonView.challenge.start_view.confirm = moduleInit(358,1219,0x2fa5d2)    -- 挑战界面-确认按钮
-- commonView.challenge.start_view.cancel = moduleinit(33,1217,0xfee0a6)    -- 挑战界面-返回按钮
-- commonView.challenge.ing_view.check = moduleInit(153,33,0x492818)    --挑战时界面, 判断是否还在挑战中
-- commonView.challenge.ing_view.stop = moduleInit(53,974,0x654b2f)    --挑战时界面，暂停按钮


-- 挑战开始
function commonView.challenge:start()
    -- 判断是否在挑战界面
    if (not checkColor(self.start_view.check)) then
        clickButton(self.start_view.cancel);
        return false;
    end
    
    -- 进行战斗
    clickButtonNoCheck(self.start_view.confirm);
    
    -- 等待战斗结束
    notRepeatUtilCheckColor(self.ing_view.check);

    --点击任意位置退出战斗
    clickButton(self.end_view.cancel);
    --获胜需要等待多几秒 到达挑战首领层会返回主界面
    
end