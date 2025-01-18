function lerp(a, b, t)
    return a + (b - a) * t
end

local ta = 0.6

function onUpdate()
    for i = 0, 3 do
        setPropertyFromGroup('strumLineNotes', i, 'x', 130 + (90 * (i % 4)))
        setPropertyFromGroup('opponentStrums', i, 'scale.x', ta)
        setPropertyFromGroup('opponentStrums', i, 'scale.y', ta)
        setPropertyFromGroup('playerStrums', i, 'scale.x', ta)
        setPropertyFromGroup('playerStrums', i, 'scale.y', ta)
    end

    for i = 4, 7 do
        setPropertyFromGroup('strumLineNotes', i, 'x', 750 + (90 * (i % 4)))
    end

    for i = 0, getProperty('notes.length') - 1 do
        if not getPropertyFromGroup('notes', i, 'isSustainNote') then
            setPropertyFromGroup('notes', i, 'scale.x', ta)
            setPropertyFromGroup('notes', i, 'scale.y', ta)
        end
    end
end
