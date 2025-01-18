function onEvent(name, value1, value2)
	if name == 'Fade UI' then
		type = tonumber(value1)
		duration = tonumber(value2);
		
		if duration < 0 then
			duration = 0;
		end

		if type == 1 and duration == 0 then
			for i = 0, 4, 1 do
				setPropertyFromGroup('playerStrums', i, 'alpha', tonumber(0))
			end
			for i = 0, 4, 1 do
				setPropertyFromGroup('opponentStrums', i, 'alpha', tonumber(0))
			end
            setProperty('healthBar.alpha',  tonumber(0))
            setProperty('iconP1.alpha',  tonumber(0))
            setProperty('iconP2.alpha',  tonumber(0))
            setProperty('score.alpha',  tonumber(0))
			setProperty('misses.alpha',  tonumber(0))
			setProperty('rating.alpha',  tonumber(0))
			setProperty('timeBG.alpha', tonumber(0))
            setProperty('timeWhite.alpha', tonumber(0))
			setProperty('currentTime.alpha', tonumber(0))
            setProperty('totalTime.alpha', tonumber(0))
			setProperty('songName.alpha', tonumber(0))
            setProperty('botplayTxt.alpha', tonumber(0))
			
		elseif type == 1 and duration > 0 then
			noteTweenAlpha("noteGoneOpp1", 0, 0, duration, "quartInOut");
            noteTweenAlpha("noteGoneOpp2", 1, 0, duration, "quartInOut");
            noteTweenAlpha("noteGoneOpp3", 2, 0, duration, "quartInOut");
            noteTweenAlpha("noteGoneOpp4", 3, 0, duration, "quartInOut");
            noteTweenAlpha("noteGone5", 4, 0, duration, "quartInOut");
            noteTweenAlpha("noteGone6", 5, 0, duration, "quartInOut");
            noteTweenAlpha("noteGone7", 6, 0, duration, "quartInOut");
            noteTweenAlpha("noteGone8", 7, 0, duration, "quartInOut");
            doTweenAlpha('hp', 'healthBar', 0, duration, 'quartInOut')
            doTweenAlpha('hpicon1', 'iconP1', 0, duration, 'quartInOut')
            doTweenAlpha('hpicon2', 'iconP2', 0, duration, 'quartInOut')
            doTweenAlpha('score', 'score', 0, duration, 'quartInOut')
			doTweenAlpha('misses', 'misses', 0, duration, 'quartInOut')
			doTweenAlpha('rating', 'rating', 0, duration, 'quartInOut')
            doTweenAlpha('timeBG', 'timeBG', 0, duration, 'quartInOut')
            doTweenAlpha('timeWhite', 'timeWhite', 0, duration, 'quartInOut')
			doTweenAlpha('currentTime', 'currentTime', 0, duration, 'quartInOut')
            doTweenAlpha('totalTime', 'totalTime', 0, duration, 'quartInOut')
			doTweenAlpha('songName', 'songName', 0, duration, 'quartInOut')
            doTweenAlpha('botplytxt', 'botplayTxt', 0, duration, 'quartInOut')
		end

		if type == 0.5 and duration == 0 then
			for i = 0, 4, 1 do
				setPropertyFromGroup('playerStrums', i, 'alpha', tonumber(0.5))
			end
			for i = 0, 4, 1 do
				setPropertyFromGroup('opponentStrums', i, 'alpha', tonumber(0.5))
			end
            setProperty('healthBar.alpha',  tonumber(0.5))
            setProperty('iconP1.alpha',  tonumber(0.5))
            setProperty('iconP2.alpha',  tonumber(0.5))
            setProperty('score.alpha',  tonumber(0.5))
			setProperty('misses.alpha',  tonumber(0.5))
			setProperty('rating.alpha',  tonumber(0.5))
			setProperty('timeBG.alpha', tonumber(0.5))
            setProperty('timeWhite.alpha', tonumber(0.5))
			setProperty('currentTime.alpha', tonumber(0.5))
            setProperty('totalTime.alpha', tonumber(0.5))
			setProperty('songName.alpha', tonumber(0.5))
            setProperty('botplayTxt.alpha', tonumber(0.5))
			
		elseif type == 0.5 and duration > 0 then
			noteTweenAlpha("noteGoneOpp1", 0, 0.5, duration, "quartInOut");
            noteTweenAlpha("noteGoneOpp2", 1, 0.5, duration, "quartInOut");
            noteTweenAlpha("noteGoneOpp3", 2, 0.5, duration, "quartInOut");
            noteTweenAlpha("noteGoneOpp4", 3, 0.5, duration, "quartInOut");
            noteTweenAlpha("noteGone5", 4, 0.5, duration, "quartInOut");
            noteTweenAlpha("noteGone6", 5, 0.5, duration, "quartInOut");
            noteTweenAlpha("noteGone7", 6, 0.5, duration, "quartInOut");
            noteTweenAlpha("noteGone8", 7, 0.5, duration, "quartInOut");
            doTweenAlpha('hp', 'healthBar', 0.5, duration, 'quartInOut')
            doTweenAlpha('hpicon1', 'iconP1', 0.5, duration, 'quartInOut')
            doTweenAlpha('hpicon2', 'iconP2', 0.5, duration, 'quartInOut')
            doTweenAlpha('score', 'score', 0.5, duration, 'quartInOut')
			doTweenAlpha('misses', 'misses', 0.5, duration, 'quartInOut')
			doTweenAlpha('rating', 'rating', 0.5, duration, 'quartInOut')
            doTweenAlpha('timeBG', 'timeBG', 0.5, duration, 'quartInOut')
            doTweenAlpha('timeWhite', 'timeWhite', 0.5, duration, 'quartInOut')
			doTweenAlpha('currentTime', 'currentTime', 0.5, duration, 'quartInOut')
            doTweenAlpha('totalTime', 'totalTime', 0.5, duration, 'quartInOut')
			doTweenAlpha('songName', 'songName', 0.5, duration, 'quartInOut')
            doTweenAlpha('botplytxt', 'botplayTxt', 0.5, duration, 'quartInOut')
		end

		if type == 0 and duration == 0 then
			for i = 0, 4, 1 do
				setPropertyFromGroup('playerStrums', i, 'alpha', tonumber(1))
			end
			for i = 0, 4, 1 do
				setPropertyFromGroup('opponentStrums', i, 'alpha', tonumber(1))
			end
            setProperty('healthBar.alpha',  tonumber(1))
            setProperty('iconP1.alpha',  tonumber(1))
            setProperty('iconP2.alpha',  tonumber(1))
            setProperty('score.alpha',  tonumber(1))
			setProperty('misses.alpha',  tonumber(1))
			setProperty('rating.alpha',  tonumber(1))
            setProperty('timeBG.alpha', tonumber(1))
            setProperty('timeWhite.alpha', tonumber(1))
			setProperty('currentTime.alpha', tonumber(1))
            setProperty('totalTime.alpha', tonumber(1))
			setProperty('songName.alpha', tonumber(1))
            setProperty('botplayTxt.alpha', tonumber(1))
			
		elseif type == 0 and duration > 0 then
			noteTweenAlpha("noteGoneOpp1", 0, 1, duration, "quartInOut");
            noteTweenAlpha("noteGoneOpp2", 1, 1, duration, "quartInOut");
            noteTweenAlpha("noteGoneOpp3", 2, 1, duration, "quartInOut");
            noteTweenAlpha("noteGoneOpp4", 3, 1, duration, "quartInOut");
            noteTweenAlpha("noteGone5", 4, 1, duration, "quartInOut");
            noteTweenAlpha("noteGone6", 5, 1, duration, "quartInOut");
            noteTweenAlpha("noteGone7", 6, 1, duration, "quartInOut");
            noteTweenAlpha("noteGone8", 7, 1, duration, "quartInOut");
            doTweenAlpha('hp', 'healthBar', 1, duration, 'quartInOut')
            doTweenAlpha('hpicon1', 'iconP1', 1, duration, 'quartInOut')
            doTweenAlpha('hpicon2', 'iconP2', 1, duration, 'quartInOut')
            doTweenAlpha('score', 'score', 1, duration, 'quartInOut')
			doTweenAlpha('misses', 'misses', 1, duration, 'quartInOut')
			doTweenAlpha('rating', 'rating', 1, duration, 'quartInOut')
            doTweenAlpha('timeBG', 'timeBG', 1, duration, 'quartInOut')
            doTweenAlpha('timeWhite', 'timeWhite', 1, duration, 'quartInOut')
			doTweenAlpha('currentTime', 'currentTime', 1, duration, 'quartInOut')
            doTweenAlpha('totalTime', 'totalTime', 1, duration, 'quartInOut')
			doTweenAlpha('songName', 'songName', 1, duration, 'quartInOut')
            doTweenAlpha('botplytxt', 'botplayTxt', 1, duration, 'quartInOut')
		end
	end
end