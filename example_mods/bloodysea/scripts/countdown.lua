function onCreate()
	makeAnimatedLuaSprite("bubble", "bubbletrans", 0, 0);
	setObjectCamera("bubble", "camOther");
	setGraphicSize("bubble", screenWidth, screenHeight);
	addAnimationByPrefix('bubble', 'doBubbles', 'bubbletrans', 18, false);
	addLuaSprite("bubble", true);
end

function onCountdownStarted()
	playAnim('bubble', 'doBubbles', false);
	runTimer("dieBubbles", 1.6);
end

function onTimerCompleted()
	if tag == "dieBubbles" then
		removeLuaSprite('bubble', true);
	end
end