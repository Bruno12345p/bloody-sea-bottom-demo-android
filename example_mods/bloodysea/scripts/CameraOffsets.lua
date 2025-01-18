local settings = {
    active = true,
    camOffset = 18,
    camSpeed = 1.7,
    camZoom = 1.0
}

local camPosition = {0, 0} 

local function calculateCameraOffsets()
    local offsets = {0, 0}
    for i = 0, 3 do
        local group = mustHitSection and "playerStrums" or "opponentStrums"
        local animationName = getPropertyFromGroup(group, i, "animation.curAnim.name")
    
        if animationName == "confirm" then
            local offsetDirection = (i == 0 or i == 2) and -1 or 1
            local direction = (i == 0 or i == 3) and 1 or 2

            offsets[direction] = settings.camOffset * offsetDirection
        end
    end
    return offsets
end

local function updateCameraProperties(offsets)
    setProperty("camFollow.x", camPosition[1] + offsets[1])
    setProperty("camFollow.y", camPosition[2] + offsets[2])
    setProperty("cameraSpeed", settings.camSpeed)
    setProperty("cameraZoom", settings.camZoom)
end

function onUpdatePost(event)
    if getProperty("isCameraOnForcedPos") or not settings.active then
        return
    end

    local offsets = calculateCameraOffsets()
    updateCameraProperties(offsets)
end

function onMoveCamera()
    camPosition = {getProperty("camFollow.x"), getProperty("camFollow.y")}
end

function onScriptInit()
end

function onScriptTerminate()
end

onScriptInit()