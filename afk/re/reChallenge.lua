require("common")

reChallenge = {};

-- 挑战按钮所在坐标
challenge_x = 372
challenge_y = 1103

challenge_confirm_x = 361
challenge_confirm_y = 981

function reChallenge.run()
    -- 点击挑战按钮
    myClick(challenge_x,challenge_y)
    
    -- 确认挑战
    myClick(challenge_confirm_x,challenge_confirm_y)
    
    while(isColor(501,1220,0xb38250)) do
        challengeAgain()
    end
end