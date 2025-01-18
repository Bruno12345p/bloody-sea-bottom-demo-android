function lerp(a, b, t)
    return a + (b - a) * t
end

local ta = 0.6
local strumSpacing = 90
local startX = 130
local secondX = 750

local function applyScaleToGroup(groupName, scaleValue)
    for i = 0, 3 do
        setPropertyFromGroup(groupName, i, 'scale.x', scaleValue)
        setPropertyFromGroup(groupName, i, 'scale.y', scaleValue)
    end
end

local function positionStrumLineNotes(groupName, startPos, spacing)
    for i = 0, 3 do
        setPropertyFromGroup(groupName, i, 'x', startPos + (spacing * i))
    end
end

function onUpdate()
    positionStrumLineNotes('strumLineNotes', startX, strumSpacing)
    positionStrumLineNotes('opponentStrums', startX, strumSpacing)
    positionStrumLineNotes('playerStrums', startX, strumSpacing)

    applyScaleToGroup('opponentStrums', ta)
    applyScaleToGroup('playerStrums', ta)

    for i = 4, 7 do
        setPropertyFromGroup('strumLineNotes', i, 'x', secondX + (strumSpacing * (i % 4)))
    end

    for i = 0, getProperty('notes.length') - 1 do
        if not getPropertyFromGroup('notes', i, 'isSustainNote') then
            setPropertyFromGroup('notes', i, 'scale.x', ta)
            setPropertyFromGroup('notes', i, 'scale.y', ta)
        end
    end
end
