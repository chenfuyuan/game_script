require "TSLib"
CLICK_SLEEP_TIME = 200
CLICK_END_SLEEP_TIME = 2000
STEP_SLEEP_TIME = 2000
DIX = 90
FIND_COLOR_WAIT_TIME = 1000
TIMEOUT_TIME = 180

--挑战界面
--判断挑战界面是否出现
CHECK_CHALLENGE_VIEW_X=290
CHECK_CHALLENGE_VIEW_Y=747
CHECK_CHALLENGE_VIEW_COLOR=0xdeba85
--挑战界面战斗
CHALLENGE_CONFIRM_X=360
CHALLENGE_CONFIRM_Y=1218
--挑战界面返回主界面
CHALLENGE_RETURN_INDEX_X=33
CHALLENGE_RETURN_INDEX_Y=1215
--挑战失败
CHECK_CHALLENGE_FAIL_X=295
CHECK_CHALLENGE_FAIL_Y=533
CHECK_CHALLENGE_FAIL_COLOR=0xfff7ff
--挑战失败后-点击屏幕退出
CHALLENGE_END_X=360
CHALLENGE_END_Y=1203
--挑战中暂停按钮
CHALLENG_STOP_BUTTON_X=61
CHALLENG_STOP_BUTTON_Y=974
CHALLENG_STOP_BUTTON_COLOR=0xfddc9a

--点击
function myClick(x, y)
    touchDown(x,y);
    mSleep(CLICK_SLEEP_TIME);
    touchUp(x,y);
    mSleep(CLICK_END_SLEEP_TIME);
end

--操作结束，休息
function stepEnd()
    mSleep(STEP_SLEEP_TIME)
end


--找色
function myFindColor(x,y,color)
    for i=1,5,1 do
        
        if(isColor(x,y,color,DIX)) then
            return true;
        end
        mSleep(FIND_COLOR_WAIT_TIME)
    end
    
    return false;
end

--持续找色，直到超时时间
function repeatUtilFindColor(x,y,color)
    i = 0
    repeat
        mSleep(FIND_COLOR_WAIT_TIME)
        if(i>TIMEOUT_TIME) then
            break
        end
        i = i+1
    until (isColor(x,y,color,DIX))
end

--挑战
function challenge()
    --判断是否是挑战界面
    if (not repeatUtilFindColor(CHECK_CHALLENGE_VIEW_X,CHECK_CHALLENGE_VIEW_Y,CHECK_CHALLENGE_VIEW_COLOR)) then
        log("当前界面不是挑战界面")
        return
    end
    
    --点击挑战
    myClick(CHALLENGE_CONFIRM_X,CHALLENGE_CONFIRM_Y)
    --等待战斗结束
    --点击任意键退出
    
    
end
