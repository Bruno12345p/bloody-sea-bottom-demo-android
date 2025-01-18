function onCreate()
	-- background shit

	makeLuaSprite('back', 'BG/back', -600, -30);
	setScrollFactor('back', 0.0, 0.0);
	scaleObject('back', 2, 2);

	makeAnimatedLuaSprite('planton','BG/planton',340,480)
	addAnimationByPrefix('planton','dance','planton',10,true)
    playAnim('planton','dance',false)
    setScrollFactor('planton', 1.0, 1.0);
    scaleObject('planton', 0.2, 0.2);

	makeAnimatedLuaSprite('cumward','BG/cumward',80,290)
	addAnimationByPrefix('cumward','dance','cumward',10,true)
    playAnim('cumward','dance',false)
    setScrollFactor('cumward', 0.5, 0.5);
    scaleObject('cumward', 0.4, 0.4);

	makeAnimatedLuaSprite('bob','BG/bob',440,450)
	addAnimationByPrefix('bob','dance','bob',10,true)
    playAnim('bob','dance',false)
    setScrollFactor('bob', 1.0, 1.0);
    scaleObject('bob', 0.25, 0.25);

	makeLuaSprite('front', 'BG/front', -600, -30);
	setScrollFactor('front', 1.0, 1.0);
	scaleObject('front', 2, 1.5);

	makeLuaSprite('mid', 'BG/mid', -700, -30);
	setScrollFactor('mid', 0.5, 0.5);
	scaleObject('mid', 2, 1.5);

	addLuaSprite('back', false);
	addLuaSprite('mid', false);
	addLuaSprite('cumward', false);
	addLuaSprite('front', false);
	addLuaSprite('planton', false);
	addLuaSprite('bob', false);

end