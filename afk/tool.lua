-- 工具类

-- 引入库
require("TSLib")    -- 触动精灵库

timeConfig = {}
timeConfig.click_down_sleep_time = 200;    -- 点击间隔时间
timeConfig.click_end_sleep_time = 2000;    -- 每次点击某个按钮后时间间隔
timeConfig.click_step_sleep_time = 2000;    -- 每次操作的时间间隔
timeConfig.check_color_sleep_time = 1000;    -- 检查颜色等待时间
timeConfig.step_end_time = 2000;    -- 每次命令结束后，等待时间
timeConfig.check_challenge_end_timeout = 180;    -- 检查战斗是否结束的超时时间 单位为秒
globalConfig = {};
globalConfig.isColor_dix = 90;
globalConfig.check_color_num = 5;    -- 检查颜色，校验次数，到达指定次数后，仍然没有校验成功，则结束检查

-- 组件初始化
function moduleInit(x,y,color)
    obj = {};
    obj.x=x;
    obj.y=y;
    obj.color=color;
    return obj;
end

-- 点击某按钮
function clickButton(comp)
    -- 检查是否是该按钮
    if (comp.color ~= nil and not isThisComp(comp)) then 
        return false
    end;
    
    --点击按钮
    touchDown(comp.x,comp.y);
    mSleep(timeConfig.click_down_sleep_time);
    touchUp(comp.x,comp.y);
    mSleep(timeConfig.click_end_sleep_time);
end

-- 点击某按钮(不进行颜色检查)
function clickButtonNoCheck(comp)
    --点击按钮
    touchDown(comp.x,comp.y);
    mSleep(timeConfig.click_down_sleep_time);
    touchUp(comp.x,comp.y);
    mSleep(timeConfig.click_end_sleep_time);
end

-- 检查是否是该组件 是返回true，否返回false
function isThisComp(comp)
    return isColor(comp.x,comp.y,comp.color,globalConfig.isColor_dix)
end

-- 检查该坐标颜色是否符合要求
function checkColor(comp)
    for i=1,globalConfig.check_color_num do
        if (isThisComp(comp)) then
            return true;
        end
        mSleep(timeConfig.check_color_sleep_time)
    end
    return false;
end

-- 每次操作结束后等待时间
function stepEnd()
    mSleep(timeConfig.step_end_time);
end

-- 检查颜色是否变化，在超时时间内变化，则返回true,否则则返回false
function notRepeatUtilCheckColor(comp)
    i = 0
    repeat
        mSleep(timeConfig.check_color_sleep_time)
        if(i>timeConfig.check_challenge_end_timeout) then
            break
        end
        i = i + 1
    until (not isThisComp(comp))
    if (i > timeConfig.check_challenge_end_timeout) then
        return false
    end
    return true
end