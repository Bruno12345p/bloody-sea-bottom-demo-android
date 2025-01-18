function onCreate()
	-- Last Wish Stage with shading

	makeLuaSprite('Backg', 'stage/lastwish/Backg', -1010, -380);
	setScrollFactor('Backg', 0.7, 0.7);
	scaleObject('Backg', 2.29, 2.29);
	
	makeLuaSprite('jellies', 'stage/lastwish/jellys', -2900, -600)
    setScrollFactor('jellies', 0.6, 0.6);
    scaleObject('jellies', 1.3, 1.3);

	makeLuaSprite('Ground', 'stage/lastwish/Ground', -1060, -360);
	setScrollFactor('Ground', 1.0, 1.0);
	scaleObject('Ground', 2.38, 2.38);

	makeLuaSprite('SeaSky', 'stage/lastwish/SeaSky', -1010, -500);
	setScrollFactor('SeaSky', 0.5, 0.5);
	scaleObject('SeaSky', 2.29, 2.29);

	makeLuaSprite('Peaktrick', 'stage/lastwish/Peaktrick', 1230, 750);
	setScrollFactor('Peaktrick', 1.0, 1.2);
	scaleObject('Peaktrick', 2.3, 2.3);

	makeLuaSprite('OldTV', 'stage/lastwish/OldTV', -3650, -5200);
	setScrollFactor('OldTV', 0.0, 0.0);
	scaleObject('OldTV', 4.7, 4.7);

	makeLuaSprite('Nicklogo', 'stage/lastwish/Nicklogo', -100, -300);
	setScrollFactor('Nicklogo', 0.0, 0.0);
	scaleObject('Nicklogo', 1.5, 1.5);

	makeLuaSprite('Blood', 'stage/lastwish/Blood', -450, -300);
	setScrollFactor('Blood', 0, 0);
	scaleObject('Blood', 3, 3);

	addLuaSprite('Peaktrick', true);
	addLuaSprite('Blood', true);
	addLuaSprite('Nicklogo', true);
	addLuaSprite('OldTV', true);
	addLuaSprite('SeaSky', false);
	addLuaSprite('Backg', false);
	addLuaSprite('jellies', false);
	addLuaSprite('Ground', false);
end

function onSongStart()
	doTweenAlpha("CuttA","Cutt", 1, 0.1, true);
	playAnim('Cutt', 'hola', true);
	triggerEvent('Ansfoxy', 'inicio', '')
	doTweenAlpha("black2","black", 0, 0.01, 'linear');
end

function onStageCreation(snapChanges)
    if curStage == 'Ohio' then
        makeAnimatedLuaSprite('flame','stage/lastwish/flame',-1740,-600)
	addAnimationByPrefix('flame','dance','flame',10,true)
	playAnim('flame','dance',false)
	setScrollFactor('flame', 1.0, 1.0);
	scaleObject('flame', 3.8, 3.8);
	addLuaSprite('flame', false);
    end
end

local isRunning = false;
function onSectionHit()
	if getRandomBool(20) and not isRunning then
		setProperty("jellies.y", -600);
		isRunning = true;
		if getRandomBool(50) then
			loadGraphic('jellies', 'stage/lastwish/jellys');
			setObjectOrder('jellies', getObjectOrder("Backg") + 1);
			scaleObject('jellies', 1.3, 1.3);
			setProperty("jellies.x", -2900);
			doTweenX('jelliesLeft', 'jellies', 1900, 2, 'linear')
			doTweenY('jelliesUp', 'jellies', -900, 3, 'sineOut')
		else
			loadGraphic('jellies', 'stage/lastwish/jellys2');
			setObjectOrder('jellies', getObjectOrder("Backg") - 1);
			scaleObject('jellies', 0.9, 0.9);
			setProperty("jellies.x", 1900);
			doTweenX('jelliesRight', 'jellies', -2900, 2, 'linear')
			doTweenY('jelliesUp', 'jellies', -900, 3, 'sineOut')
		end
	end
end

function onTweenCompleted(tag)
	if tag == "jelliesUp" then
		isRunning = false;
	end
end

function onEvent(name,value1,value2)
	if name == 'Ansfoxy' then 
		if value1 == 'inicio' then
			doTweenX('cX', 'c.scale', 1, 0.001, 'linear')
			doTweenY('cY', 'c.scale', 1, 0.001, 'linear')
			doTweenAlpha("white1","white", 5, 000000.1, 'linear');
			doTweenAlpha("white2","white", 0, 1, 'linear');
			doTweenAlpha("black2A","black2", 1, 0.1, true);
			setProperty('BG0.visible', false)
			setProperty('BG1.visible', false)
			doTweenColor('bfC', 'boyfriend', '000000', 0.01, 'linear')
			doTweenColor('dadC', 'dad', '000000', 0.01, 'linear')
		end
		if value1 == 'nocut' then
			doTweenAlpha("CuttA","Cutt", 0, 0.1, true);
		end
		if value1 == 'inicio2' then
			doTweenX('cX', 'c.scale', 2, 0.001, 'linear')
			doTweenY('cY', 'c.scale', 2, 0.001, 'linear')
			doTweenAlpha("white1","white", 5, 000000.1, 'linear');
			doTweenAlpha("white2","white", 0, 1, 'linear');
			doTweenAlpha("black2A","black2", 0, 0.1, true);
			setProperty('BG0.visible', true)
			setProperty('BG1.visible', false)
			doTweenColor('bfC', 'boyfriend', 'FFFFFF', 0.01, 'linear')
			doTweenColor('dadC', 'dad', 'FFFFFF', 0.01, 'linear')
		end
		if value1 == 'hud' then
			doTweenAlpha('fadeInn', 'camHUD', 0, 0.5, 'linear')
		end
		if value1 == 'stage1' then
			doTweenAlpha('fadeIn', 'camHUD', 1, 0.5, 'linear')
			doTweenAlpha("white1","white", 5, 000000.1, 'linear');
			doTweenAlpha("white2","white", 0, 1, 'linear');
			setProperty('BG0.visible', false)
			setProperty('BG1.visible', true)
		end
		if value1 == 'stage2' then
			doTweenAlpha("white1","white", 5, 000000.1, 'linear');
			doTweenAlpha("white2","white", 0, 1, 'linear');
			setProperty('BG0.visible', true)
			setProperty('BG1.visible', false)
		end
	end
end