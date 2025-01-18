local originalXPositions = {}
local shakeMagnitude = 3
local shakeDuration = 0.01
local shakeSpeed = 0.05

function onUpdatePost()
	local angleOfs = math.random(-3, 3)
	local posXOfs = math.random(-2, 2)
	local posYOfs = math.random(-2, 2)
	setProperty('iconP2.angle', angleOfs)
	setProperty('iconP2.x', getProperty('iconP2.x') + posXOfs)
	setProperty('iconP2.y', defaultY + posYOfs)
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    handleohwaitEffects(direction, noteType)

    if #originalXPositions == 0 then
        for i = 0, 5 do
            originalXPositions[i] = getPropertyFromGroup('strumLineNotes', i, 'x')
        end
    end

    for i = 0, 5 do
        runTimer('shake' .. i, shakeSpeed, math.floor(shakeDuration / shakeSpeed))
    end

    if isSustainNote then
        createSustainNoteEffects(id, direction)
    else
        spawnFakeNote(direction)
    end
end

function handleohwaitEffects(direction, noteType)
        local tweenDuration = 0.2
        
        cancelTween('revert')

        if direction == 0 then
            setProperty('camHUD.angle', -1)
            doTweenAngle('revert', 'camHUD', 0, tweenDuration, 'CircOut')
        elseif direction == 1 then
            setProperty('camHUD.y', 3)
            doTweenY('revert', 'camHUD', 0, tweenDuration, 'CircOut')
        elseif direction == 2 then
            setProperty('camHUD.y', -3)
            doTweenY('revert', 'camHUD', 0, tweenDuration, 'CircOut')
        elseif direction == 3 then
            setProperty('camHUD.angle', 1)
            doTweenAngle('revert', 'camHUD', 0, tweenDuration, 'CircOut')
        end

        cameraShake('hud', 0.001, 0.1)
    end

function onTimerCompleted(tag, loops, loopsLeft)
    for i = 0, 5 do
        if tag == 'shake' .. i then
            applyShakeEffect(i, loopsLeft)
        end
    end
end

function applyShakeEffect(noteIndex, loopsLeft)
    local shake = math.random(-shakeMagnitude, shakeMagnitude)
    setPropertyFromGroup('strumLineNotes', noteIndex, 'x', originalXPositions[noteIndex] + shake)
    
    if loopsLeft == 0 then
        setPropertyFromGroup('strumLineNotes', noteIndex, 'x', originalXPositions[noteIndex])
    end
end

function startsWith(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

function createSustainNoteEffects(id, direction)
    local animName = getPropertyFromGroup('notes', id, 'animation.curAnim.name')
    if animName:find('Scroll') then
        spawnFakeNote(direction)
    elseif animName:find('hold') then
        spawnFakeSusNote(direction)
    elseif animName:find('holdend') then
        spawnFakeSusNoteEnd(direction)
    end
end

--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⠤⢄⡀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠋⠁⠀⠀⠀⠉⠲⣄⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠔⠋⠁⠀⠀⠈⢿⣲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡎⠀⠀⠀⠀⠀⠀⠀⠀⡈⢧⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠃⠀⠀⠀⠀⠀⠀⠈⠘⠙⣟⠀⠀⠀⠀⠀⠀⠀⠀⠸⡇⠀⠀⠀⠀⠀⠀⢠⠒⠋⠉⣧⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⢀⣀⣀⣀⠀⢣⡀⠀⠀⠀⠀⠙⢻⠒⠀⠀⣸⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡠⠴⠊⠉⠉⠁⠀⠀⠉⠛⢧⡀⠀⠀⠀⠉⠙⣍⣀⣤⠏⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢣⡀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠟⠥⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣄⣀⠀⠀⠀⣀⠽⠋⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠱⢄⣀⡀⠀⣀⣀⢤⣞⡋⠀⣹⠃⠂⣴⣯⣭⠉⢲⡔⠉⢉⣙⢧⡈⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⠀⣸⠀⠹⠉⠁⠀⢼⣿⣿⣿⡇⠈⡇⢰⣿⣿⡇⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⣠⠤⣤⡀⠀⡟⣿⣿⣿⡇⠀⡇⢸⣿⣿⣇⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⠳⣏⠉⠙⢦⡹⣿⣿⣿⠃⣸⢣⡸⣿⣿⣿⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣧⢹⣆⠀⠀⠙⠛⠣⠴⢮⡗⠺⣿⣛⣻⢦⠧⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣧⣻⣧⡀⢀⠤⠖⠒⠂⠀⠀⠀⡆⠀⣸⣅⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⣀⡡⠗⢿⣷⣄⠠⠒⠁⠀⠀⢀⢜⣡⠞⠁⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠋⠀⠀⠀⢹⠀⠀⠻⣿⣿⠷⣶⣶⣾⣿⣟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠚⠀⠀⠀⠀⠀⢀⠂⠰⣦⣧⡛⠉⣹⠉⠙⡟⡎⢢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠞⠀⠀⠀⠀⠀⠀⢀⠼⠀⠀⡼⣻⣿⡟⠣⣍⣱⠿⡇⠈⢇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠟⠀⠀⠀⠀⠀⣤⠚⠁⠀⢀⡞⠁⠇⡿⡿⡄⠀⠀⢰⠃⠀⠈⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠏⠀⠀⠀⠀⢀⡜⠁⠀⠀⢰⣿⡗⠼⠀⡇⡇⢣⠀⢠⡇⠀⠀⠀⠈⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⢴⣃⡀⠀⠀⠀⠀⡼⣤⣠⣆⠀⠀⡞⠀⠀⠀⠁⣷⡼⡳⢿⠃⠀⠀⠀⠀⠘⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠎⢁⣰⠾⠇⠀⠀⣠⠞⠁⠯⢁⡿⠆⠀⣇⣴⣶⣶⡤⠏⣴⡇⡟⡆⠀⠀⠀⠀⠀⢹⡀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⡶⠚⠑⠂⠀⠀⡾⠃⠀⠀⠀⠀⠀⠀⠀⡏⠿⣿⣿⣿⣿⣿⡇⡇⣿⡀⠀⠀⠀⠀⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠋⠁⠀⠀⠀⠀⠀⢀⡇⠀⠀⠀⠀⠀⠀⠾⠃⡇⠀⠈⢿⣿⣿⡿⡇⢤⠈⢣⠀⠀⠀⠀⠀⠈⣆⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⢺⣷⡀⠀⠀⠀⠀⠀⢰⡟⢳⣴⠤⣄⠀⠀⠀⠀⡴⠁⠀⠀⠀⠀⠀⠀⡇⢘⡆⢺⡇⠀⠀⠀⢀⣤⠜⢦⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⢠⠞⢉⡿⣯⣙⠒⡶⣶⠲⣏⠀⢸⠋⠉⠪⡳⣄⠀⢀⠇⠀⠀⠀⠀⠀⣠⡼⢷⡿⠻⣸⣓⢒⣒⡯⠝⠛⠓⠻⡄⣀⣀⠀⠀⠀
--⠀⠀⠀⠀⠀⢀⡟⣰⠉⠸⢣⣏⠉⠉⠉⢯⡧⠀⢣⠀⠀⠀⠘⠮⠭⡽⣤⣴⡒⠒⠒⠋⠙⢻⣧⠀⠀⠇⢘⣏⣀⣠⢄⣤⠄⢠⣿⠵⢿⠀⠀⠀
--⠀⠀⠀⠀⠀⠸⣾⠟⡠⣴⡼⡿⠋⠁⣦⣨⡏⠀⢸⡆⠀⠀⠀⠀⠀⠁⣇⣀⡷⠀⠀⠀⠀⠈⢟⠁⠀⢰⣾⢇⠈⠇⢈⡙⣦⣼⠇⢀⣼⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⣇⡴⠁⢻⢸⠃⠀⠀⣿⡟⡇⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡄⠀⠀⢸⠀⠀⠀⢱⡘⠶⠒⠉⢉⣡⠴⠊⠉⢹⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠏⠀⠀⠀⣿⣿⡃⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⢰⠋⠀⠀⠀⠀⡌⠀⠀⠀⠀⢳⣗⠒⠋⠁⠀⠀⠀⠀⠀⡆⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠷⠀⠀⠀⠀⠀⠀⠀⢠⡿⠀⠀⠀⢀⣰⠧⠀⠀⠀⠀⠀⠈⢻⣖⣀⠀⠀⠀⠀⠀⢻⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡟⠀⠀⠀⢸⠂⠀⠀⠀⠀⠀⠀⡼⠁⠀⠀⠀⢸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⢺⡄⠀⠀⠀⠀⠈⡆⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⡇⠀⠀⠀⢸⡀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⣗⣀⠀⠀⠀⢻⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⡿⠁⠀⠀⠀⠈⢱⡀⠀⠀⠀⠀⢠⠃⠀⠀⠀⡼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢀⣆⠀⠈⡆
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠇⠀⠀⠀⠀⠀⢘⡇⠀⠀⠀⠀⢸⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢲⣀⠽
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⡇⠀⠀⠀⠀⠀⠀⢀⣇⠀⠀⠀⠀⢸⠀⠀⠀⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⠛⠀⠀⢀⣀⣀⡀⠀⠘⡟⠀⠀⠀⠀⢸⡀⠀⠀⣯⡀⠀⠀⢀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⢀⣤⣤⣤⡤⠤⠶⠛⠓⠋⠁⠀⢠⠞⠁⠀⠀⠈⠙⠲⠛⠢⠤⠤⠤⣾⡙⠒⠋⠀⠙⠒⠋⠁⠀⠀⠙⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⣾⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣧⡗⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠈⠛⠛⠓⠒⠲⠆⠀⠀⠀⠀⠀⠀⠘⢦⣀⠀⠀⠀⢀⣀⣀⡠⠤⠞⠛⠋⠉⠚⠷⣄⠀⠀⠀⠀⠀⠀⠀⢀⠗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⠒⠒⠒⠒⠚⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀