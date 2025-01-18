
function onCreatePost()

	image='healthbar1'
	scalex='1'
	scaley='1'
	x=55
	y=53
if songName=='my-spot' then
	image='hud-my-spot'
	scalex='0.960'
	scaley='0.960'
	x=110
	y=240
end	

	makeLuaSprite('Health', image,getProperty('healthBar.x')-x,getProperty('healthBar.y')-y)
	setObjectCamera('Health', 'hud')
	addLuaSprite('Health', true)
	--setObjectOrder('Health', getObjectOrder('healthBar') + 3)
	setProperty('healthBar.visible', true)
	setProperty('healthBar.scale.x',2.5)
	setProperty('healthBar.scale.x',1)
	setProperty('healthBarBG.scale.x',2.5)
	setProperty('healthBarBG.scale.y',1)
	setProperty('Health.scale.x',scalex)
	setProperty('Health.scale.y',scaley)
end

function onCreate()
 setProperty('skipCountdown', true);

  setProperty('timeBarBG.visible', false)
  setProperty('timeBar.visible', false)
  setProperty('timeTxt.visible', true)
  setProperty('timeTxt.y', 570)
  setProperty('timeTxt.x', 60)

    setProperty('scoreTxt.visible', true)
    setProperty('scoreTxt.y', 580)
    setProperty('scoreTxt.x', -20)
	    setProperty('showRating', false)
    	    setProperty('showComboNum', false)
	    setProperty('showCombo', false)

function onUpdatePost()
  setProperty('iconP1.x', 1100);
  setProperty('iconP2.x', 30);
end
end    