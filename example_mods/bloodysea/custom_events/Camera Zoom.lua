function onEvent(name,value1,value2)
    if name == "Camera Zoom" then
        amount = value1
        duration = value2
        doTweenZoom('in','camGame',amount,duration,'circOut')
    end
end