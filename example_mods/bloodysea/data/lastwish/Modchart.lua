local flashalpha = '88'

function inTable(tbl, item)
    for key, value in pairs(tbl) do
        if value == item then return key end
    end
    return false
end

function onStepHit()
    if StepHitThing[curStep] then 
        StepHitThing[curStep]()
    end
end

StepHitThing = {
    [1] = function()
        doTweenAlpha('cameraAlphy', 'camHUD',0, 0.25)
        doTweenZoom('cameraZoomy', 'camHUD', 0.75, 1, 'circOut')
    end,

    [46] = function()
        cameraFlash('camGame', '0x'..flashalpha..'c71d1d', 1.5, false)
        setProperty('camHUD.alpha', 1)
        setProperty('camGame.zoom', 1)
    end
}