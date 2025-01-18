function onEvent(n,v1,v2)
    if n == "Camera Zoom In" then
        doTweenZoom('zoomtween', 'camGame', v1, v2, 'circOut')
        setProperty('defaultCamZoom', v1)
	end
end