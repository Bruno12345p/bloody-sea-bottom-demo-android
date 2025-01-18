local noteNoAnimation = {}
local noteNoMissAnimation = {}
local stillMiss = false

function onCreatePost()
    for i = 0, getProperty('unspawnNotes.length') - 1 do
        if getProperty('unspawnNotes['..i..'].isSustainNote') then
            noteNoAnimation[getProperty('unspawnNotes['..i..'].noteType')] = getProperty('unspawnNotes['..i..'].noAnimation')
            noteNoMissAnimation[getProperty('unspawnNotes['..i..'].noteType')] = getProperty('unspawnNotes['..i..'].noMissAnimation')

            noteNoMissAnimation['Hey!'] = true
            noteNoMissAnimation['Hurt Note'] = true

            setProperty('unspawnNotes['..i..'].noAnimation', true)
            setProperty('unspawnNotes['..i..'].noMissAnimation', true)
        end
    end
end

function onUpdate()
    if stringEndsWith(getProperty('boyfriend.animation.curAnim.name'), 'miss') and stillMiss then
        setProperty('boyfriend.animation.finished', false)
    end
end

function goodNoteHit(id, data, type, sus)
    if sus then
        if not noteNoAnimation[type] then
            local char = getProperty('notes.members['..id..'].gfNote') and 'gf' or 'boyfriend'
            setProperty(char..'.holdTimer', 0)
            if getProperty(char..'.animation.curAnim.name') ~= (getProperty('singAnimations')[data + 1]..getProperty('notes.members['..id..'].animSuffix')) then
                playAnim(char, getProperty('singAnimations')[data + 1]..getProperty('notes.members['..id..'].animSuffix'))
            end
        end
    end
end

function opponentNoteHit(id, data, type, sus)
    if sus then
        if not noteNoAnimation[type] then
            local char = getProperty('notes.members['..id..'].gfNote') and 'gf' or 'dad'
            setProperty(char..'.holdTimer', 0)
            if getProperty(char..'.animation.curAnim.name') ~= (getProperty('singAnimations['..data..']')..getProperty('notes.members['..id..'].animSuffix')) then
                playAnim(char, getProperty('singAnimations')[data + 1]..getProperty('notes.members['..id..'].animSuffix'))
            end
        end
    end
end

function noteMiss(id, data, type, sus)
    if sus then
        if not noteNoMissAnimation[type] then
            stillMiss = true
            if getProperty('boyfriend.animation.curAnim.name') ~= (getProperty('singAnimations')[data + 1]..'miss') and getProperty('boyfriend.hasMissAnimations') then
                playAnim('boyfriend', getProperty('singAnimations')[data + 1]..'miss')
            end
            if stringEndsWith(getProperty('notes.members['..id..'].animation.curAnim.name'), 'end') then
                stillMiss = false
            end
        end
    end
end

function onCreatePostOld()
    for i = 0, getProperty('unspawnNotes.length') - 1 do
        if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
            setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
        end
    end
end

function goodNoteHitOld(i, d, t, s)
    if not s then
        callMethod('playerStrums.members['..d..'].playAnim', {'static', true})
        callMethod('playerStrums.members['..d..'].playAnim', {'confirm'})
    end

    if s then
        setProperty('boyfriend.holdTimer', 0)
        if getProperty("playerStrums.animation.curAnim") == nil or getProperty("playerStrums.animation.curAnim.name") == "static" then
            setProperty('playerStrums.members['..d..'].animation.curAnim.curFrame', 3)
        end

        if stringStartsWith(getAnimationName("boyfriend"), "sing") then
            return
        end
    end
end

function opponentNoteHitOld(i, d, t, s)
    if not s then
        callMethod('opponentStrums.members['..d..'].playAnim', {'static', true})
        callMethod('opponentStrums.members['..d..'].playAnim', {'confirm'})
    end

    if s then
        setProperty('dad.holdTimer', 0)
        if getProperty("opponentStrums.animation.curAnim") == nil or getProperty("opponentStrums.animation.curAnim.name") == "static" then
            setProperty('opponentStrums.members['..d..'].animation.curAnim.curFrame', 3)
        end

        if stringStartsWith(getAnimationName("dad"), "sing") then
            return
        end
    end
end

function getAnimationName(char)
    return getProperty(char .. ".animation.curAnim") == nil and "" or getProperty(char .. ".animation.curAnim.name")
end

function getStrumAnimationName()
    return getProperty("playerStrums.animation.curAnim") == nil and "" or getProperty("playerStrums.animation.curAnim.name")
end
