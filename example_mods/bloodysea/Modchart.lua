local noflashy
local noteXCenter = {412, 524, 636, 748} -- Notes center
local swap1 = {636, 524, 412, 748} 
local swap2 = {412, 748, 636, 534} 
local noteYPlace = {50, 570} -- Up, Down
local ha = 0 
local flashalpha = '88'

function inTable(tbl, item)
    for key, value in pairs(tbl) do
        if value == item then return key end
    end
    return false
end

function onStepHit()
    if curStep == 1 then
        doTweenAlpha('cameraAlphy', 'camHUD',0, 0.25)
        --doTweenAlpha('awasda', 'triangle',0, 0.25)    
        doTweenZoom('cameraZoomy', 'camHUD', 0.75, 1, 'circOut')
        setProperty('solid.color', getColorFromHex("FFFFFF"))
        doTweenAlpha('asdawsd', 'solid', 0.95 , 0.25)           
    end

    if curStep == 46 then
        cameraFlash('camGame', '0x'..flashalpha..'FFFF00', 1, false)
        addLuaSprite('fgnum')
        setProperty('camHUD.alpha', 1)
        doTweenAlpha('asdawsd', 'solid', 0 , 0.25)   
        setProperty('camGame.zoom', 1)
        removeLuaSprite('triangle')
        cancelTween('gsogega')
    end

    if curStep == 207 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
        doTweenZoom('gameZoomy', 'camGame', 0.8, 0.2, 'circOut')
        doTweenX('cameraMovey1', 'camHUD', 640, 0.15, 'circIn')
        doTweenY('cameraMovey2', 'camHUD', -480, 0.15, 'circIn')
    end
    
    if curStep == 208 then
        setProperty('camHUD.x', -640)
        setProperty('camHUD.y', 480)
        doTweenX('cameraMovey1', 'camHUD', 0, 0.15, 'circOut')
        doTweenY('cameraMovey2', 'camHUD', 0, 0.15, 'circOut')
    end
    
    if curStep == 210 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
        doTweenZoom('gameZoomy', 'camGame', 0.9, 0.2, 'circOut')
        doTweenX('cameraMovey1', 'camHUD', -640, 0.15, 'circIn')
        doTweenY('cameraMovey2', 'camHUD', 480, 0.15, 'circIn')
    end
    
    if curStep == 211 then
        setProperty('camHUD.x', 640)
        setProperty('camHUD.y', -480)
        doTweenX('cameraMovey1', 'camHUD', 0, 0.15, 'circOut')
        doTweenY('cameraMovey2', 'camHUD', 0, 0.15, 'circOut')
    end
    
    if curStep == 213 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
        doTweenZoom('gameZoomy', 'camGame', 1, 0.2, 'circOut')
        doTweenX('cameraMovey1', 'camHUD', 640, 0.15, 'circIn')
        doTweenY('cameraMovey2', 'camHUD', -480, 0.15, 'circIn')
    end
    
    if curStep == 214 then
        setProperty('camHUD.x', -640)
        setProperty('camHUD.y', 480)
        doTweenX('cameraMovey1', 'camHUD', 0, 0.5, 'circOut')
        doTweenY('cameraMovey2', 'camHUD', 0, 0.5, 'circOut')
    end
    
    if curStep == 215 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
    end
    
    if curStep == 220 then
        doTweenX('cameraMovey1', 'camHUD', -640, 0.3, 'circIn')
        doTweenX('gameMovey1', 'grid2', gridx-64, 0.3, 'circIn')
    end
    
    if curStep == 223 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
        setProperty('camHUD.x', 640)
        doTweenX('cameraMovey1', 'camHUD', 0, 0.5, 'circOut')
        doTweenX('gameMovey1', 'grid2', gridx-64, 0.5, 'circOut')
    end    

    if curStep == 255 then
        for i = 0,7 do
            noteTweenY('noteMoveyioe'..i, i, noteYPlace[(downscroll and 1 or 2)], 0.8, 'circInOut')
            noteTweenDirection("noteFlippy" ..i, i, -90, 0.8, 'circInOut')
            origAngle = getPropertyFromGroup('strumLineNotes', i, 'angle')
            noteTweenAngle('spinsies'..i, i, origAngle - 1440, 7.714, 'circOut')
        end
        doTweenZoom('caajawde', 'camHUD', 0.85, 1, 'circOut')
    end

    if curStep == 383 then
        for i = 4,7 do
            noteTweenDirection("noteFlippy" ..i, i, 90, 0.01)
            noteTweenY("RESETY"..i, i, _G['defaultPlayerStrumY'..i-4], 0.5, 'circOut')
            noteTweenAngle('spinsies'..i, i, 0, 1, 'circOut')
            end
        end
    --setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)

    if curStep == 524 then
        for i = 0,7 do 
            noteTweenX('afdaifuehja'..i, i, noteXCenter[(i % 4) + 1], 0.1)
        end
    end

    if curStep == 528 then
        setProperty('camHUD.y', noflashy and 0 or (math.random(-10, 10)))
        setProperty('camHUD.angle', math.random(-1, 1))
        setProperty('fractalsmall.y', math.random(-5, 5))
    end

    if curStep == 615 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
        for i = 0,7 do
            cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
            noteTweenX('peales'..i, i, swap2[(i % 4) +1], 0.25, 'circOut')
        end
    end

    if curStep == 618 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
        for i = 0,7 do
            cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
            noteTweenX('peales'..i, i, swap1[(i % 4) +1], 0.25, 'circOut')
        end
    end

    if curStep == 621 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
        for i = 0,7 do
            noteTweenX('peales'..i, i, swap2[(i % 4) +1], 0.25, 'circOut')
        end
    end

    if curStep == 623 then
        for i = 0,7 do
            cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
            noteTweenX('peales'..i, i, noteXCenter[(i % 4) +1], 0.25, 'circOut')
        end
    end

    if curStep == 647 then
        for i = 0,3 do
            noteTweenY('noteawder'..i, i, 1000, 0.5, 'circIn')
            --setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
        for i = 0,7 do
            cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
            noteTweenX('peales'..i, i, swap1[(i % 4) +1], 0.25, 'circOut')
        end
    end

    if curStep == 650 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
        for i = 0,7 do
            cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
            noteTweenX('peales'..i, i, swap2[(i % 4) +1], 0.25, 'circOut')
        end
    end

    if curStep == 653 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
        for i = 0,7 do
            noteTweenX('peales'..i, i, swap1[(i % 4) +1], 0.25, 'circOut')
        end
    end

    if curStep == 655 then
        doTweenX('cammyMove', 'camHUD', 0, 0.1, 'circOut')
        for i = 0,7 do
            noteTweenDirection("noteFlippy" ..i, i, 90, 1, 'circOut')
            noteTweenAngle('noteawder'..i, i, 0, 1, 'circOut')
            origAngle = getPropertyFromGroup('strumLineNotes', i, 'angle')
            noteTweenAngle('awdasda'..i, i, 0, 2, 'circOut')
            noteTweenX('peales'..i, i, noteXCenter[(i % 4) +1], 0.25, 'circOut')
        end
    end

    if curStep == 783 then
        cameraFlash('camGame', '0x'..flashalpha..'FFFF00', 1, false)
        addLuaSprite('fgnum')
        setProperty('camHUD.alpha', 1)
        doTweenAlpha('asdawsd', 'solid', 0 , 0.25)   
        setProperty('camGame.zoom', 1)
        removeLuaSprite('triangle')
        cancelTween('gsogega')
        for i = 0,7 do
        noteTweenX('aeiozsduy'..i, i, noteXCenter[(i % 4) + 1], 0.5, 'circOut')
        noteTweenY('aawezdfuy'..i, i, noteYPlace[(downscroll and 2 or 1)], 0.5, 'circOut')
        end
        for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
    end

    if curStep == 848 then
        for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
        end
    end

    if curStep == 864 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
        doTweenZoom('gameZoomy', 'camGame', 0.8, 0.2, 'circOut')
        doTweenX('cameraMovey1', 'camHUD', -640, 0.15, 'circIn')
        doTweenY('cameraMovey2', 'camHUD', 480, 0.15, 'circIn')
    end

    if curStep == 865 then
        setProperty('camHUD.x', 640)
        setProperty('camHUD.y', -480)
        doTweenX('cameraMovey1', 'camHUD', 0, 0.15, 'circOut')
        doTweenY('cameraMovey2', 'camHUD', 0, 0.15, 'circOut')
    end

    if curStep == 867 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
        doTweenZoom('gameZoomy', 'camGame', 0.9, 0.2, 'circOut')
        doTweenX('cameraMovey1', 'camHUD', 640, 0.15, 'circIn')
        doTweenY('cameraMovey2', 'camHUD', -480, 0.15, 'circIn')
    end

    if curStep == 868 then
        setProperty('camHUD.x', -640)
        setProperty('camHUD.y', 480)
        doTweenX('cameraMovey1', 'camHUD', 0, 0.15, 'circOut')
        doTweenY('cameraMovey2', 'camHUD', 0, 0.15, 'circOut')
    end

    if curStep == 870 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
        doTweenZoom('gameZoomy', 'camGame', 1, 0.2, 'circOut')
        doTweenX('cameraMovey1', 'camHUD', -640, 0.15, 'circIn')
        doTweenY('cameraMovey2', 'camHUD', 480, 0.15, 'circIn')
    end

    if curStep == 871 then
        setProperty('camHUD.x', 640)
        setProperty('camHUD.y', -480)
        doTweenX('cameraMovey1', 'camHUD', 0, 0.5, 'circOut')
        doTweenY('cameraMovey2', 'camHUD', 0, 0.5, 'circOut')
    end

    if curStep == 872 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
    end

    if curStep == 877 then
        doTweenX('cameraMovey1', 'camHUD', 640, 0.3, 'circIn')
        doTweenX('gameMovey1', 'grid2', gridx64, 0.3, 'circIn')
    end

    if curStep == 880 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
        setProperty('camHUD.x', -640)
        doTweenX('cameraMovey1', 'camHUD', 0, 0.5, 'circOut')
        doTweenX('gameMovey1', 'grid2', gridx64, 0.5, 'circOut')
    end

    if curStep == 908 then
        doTweenAlpha('cameraAlphy', 'camHUD',0, 0.25)
        --doTweenAlpha('awasda', 'triangle',0, 0.25)    
        doTweenZoom('cameraZoomy', 'camHUD', 0.75, 1, 'circOut')
        setProperty('solid.color', getColorFromHex("FFFFFF"))
        doTweenAlpha('asdawsd', 'solid', 0.95 , 0.25)           
    end

    if curStep == 944 then
        cameraFlash('camGame', '0x'..flashalpha..'FFFF00', 0.5, false)
        addLuaSprite('fgnum')
        setProperty('camHUD.alpha', 1)
        doTweenAlpha('asdawsd', 'solid', 0 , 0.25)   
        setProperty('camGame.zoom', 1)
        removeLuaSprite('triangle')
        cancelTween('gsogega')
    end


    if curStep == 1198 then
        noteTweenX('aeiozsduy'..i, i, noteXCenter[(i % 4) + 1], 0.5, 'circOut')
        noteTweenY('aawezdfuy'..i, i, noteYPlace[(downscroll and 2 or 1)], 0.5, 'circOut')
    end

    if curStep == 1200 then
        cameraFlash('camGame', '0x'..flashalpha..'FFFF00', 1, false)
        addLuaSprite('fgnum')
        setProperty('camHUD.alpha', 1)
        doTweenAlpha('asdawsd', 'solid', 0 , 0.25)   
        setProperty('camGame.zoom', 1)
        removeLuaSprite('triangle')
        cancelTween('gsogega')
    end

    if curStep == 1279 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
        doTweenZoom('gameZoomy', 'camGame', 0.8, 0.2, 'circOut')
        doTweenX('cameraMovey1', 'camHUD', 640, 0.15, 'circIn')
        doTweenY('cameraMovey2', 'camHUD', -480, 0.15, 'circIn')
    end
    
    if curStep == 1280 then
        setProperty('camHUD.x', -640)
        setProperty('camHUD.y', 480)
        doTweenX('cameraMovey1', 'camHUD', 0, 0.15, 'circOut')
        doTweenY('cameraMovey2', 'camHUD', 0, 0.15, 'circOut')
    end
    
    if curStep == 1282 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
        doTweenZoom('gameZoomy', 'camGame', 0.9, 0.2, 'circOut')
        doTweenX('cameraMovey1', 'camHUD', -640, 0.15, 'circIn')
        doTweenY('cameraMovey2', 'camHUD', 480, 0.15, 'circIn')
    end
    
    if curStep == 1283 then
        setProperty('camHUD.x', 640)
        setProperty('camHUD.y', -480)
        doTweenX('cameraMovey1', 'camHUD', 0, 0.15, 'circOut')
        doTweenY('cameraMovey2', 'camHUD', 0, 0.15, 'circOut')
    end
    
    if curStep == 1285 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
        doTweenZoom('gameZoomy', 'camGame', 1, 0.2, 'circOut')
        doTweenX('cameraMovey1', 'camHUD', 640, 0.15, 'circIn')
        doTweenY('cameraMovey2', 'camHUD', -480, 0.15, 'circIn')
    end
    
    if curStep == 1286 then
        setProperty('camHUD.x', -640)
        setProperty('camHUD.y', 480)
        doTweenX('cameraMovey1', 'camHUD', 0, 0.5, 'circOut')
        doTweenY('cameraMovey2', 'camHUD', 0, 0.5, 'circOut')
    end
    
    if curStep == 1287 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
    end
    
    if curStep == 1292 then
        doTweenX('cameraMovey1', 'camHUD', -640, 0.3, 'circIn')
        doTweenX('gameMovey1', 'grid2', gridx-64, 0.3, 'circIn')
    end
    
    if curStep == 1295 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.2, false)
        setProperty('camHUD.x', 640)
        doTweenX('cameraMovey1', 'camHUD', 0, 0.5, 'circOut')
        doTweenX('gameMovey1', 'grid2', gridx-64, 0.5, 'circOut')
    end

    if curStep == 1328 then

    end
        --setPropertyFromGroup('notes', i, 'copyX', false)
            
        --strumLine = 'playerStrums'

        --time = getPropertyFromGroup('notes', i, 'strumTime')
        --receptorX = getPropertyFromGroup(strumLine, getPropertyFromGroup('notes', i, 'noteData') , 'x')
        --setPropertyFromGroup('notes', i, 'x', receptorX + math.sin((songPos - time) / 50) * thing)
end

function onUpdate(elapsed)
    if enablemodchart == true then
    songPos = getSongPosition()
    currentBeat = (songPos / 1000) * (bpm / 60)
    noflashy = getPropertyFromClass('flixel.FlxG','save.data.noFlashy')
    if (curStep >= 528 and curStep <= 655) then
            --setProperty('camHUD.y', noflashy and 0 or (math.random(-10, 10)))
            --setProperty('camHUD.angle', math.random(-10, 10))
            --setProperty('fractalsmall.y', math.random(-10, 10))
    end

        if (curStep >= 1072 and curStep <= 1577) then
            for i = 0,3 do
                setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
            end
            for i = 4,7 do 
                --setPropertyFromGroup('strumLineNotes', i, 'x', noteXCenter[(i % 4) + 1] + 16 * math.sin((currentBeat + i*0.25) * math.pi))
                --setPropertyFromGroup('strumLineNotes', i, 'y', noteYPlace[(downscroll and 2 or 1)] + 16 * math.cos((currentBeat + i*0.25) * math.pi))
                noteTweenX('aeiozsduy'..i, i, 605 + 512 * math.sin(((currentBeat / 8) + i*0.25) * math.pi), 0.5)
                noteTweenY('aawezdfuy'..i, i, noteYPlace[(downscroll and 2 or 1)] + 64 * math.cos(((currentBeat / 8) + i*0.25) * math.pi), 0.5)
            end
            doTweenAngle('wawodfa', 'camHUD', math.cos(currentBeat / 2) * 20, 0.5)
        end
            if (curStep >= 1198 and curStep <= 1706) then
                for i = 0,7 do
                noteTweenX('aeiozsduy'..i, i, noteXCenter[(i % 4) + 1], 0.5, 'circOut')
                noteTweenY('aawezdfuy'..i, i, noteYPlace[(downscroll and 2 or 1)], 0.5, 'circOut')
                doTweenAngle('wawodfa', 'camHUD', 0, 0.5,'circOut')
                end
        end
    end
end
