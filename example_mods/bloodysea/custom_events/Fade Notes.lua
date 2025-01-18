function onEvent(name, value1, value2)
	if name == 'Fade Notes' then
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
			
		elseif type == 1 and duration > 0 then
			noteTweenAlpha("noteGoneOpp1", 0, 0, duration, "quartInOut");
            noteTweenAlpha("noteGoneOpp2", 1, 0, duration, "quartInOut");
            noteTweenAlpha("noteGoneOpp3", 2, 0, duration, "quartInOut");
            noteTweenAlpha("noteGoneOpp4", 3, 0, duration, "quartInOut");
            noteTweenAlpha("noteGone5", 4, 0, duration, "quartInOut");
            noteTweenAlpha("noteGone6", 5, 0, duration, "quartInOut");
            noteTweenAlpha("noteGone7", 6, 0, duration, "quartInOut");
            noteTweenAlpha("noteGone8", 7, 0, duration, "quartInOut");
		end

		if type == 0 and duration == 0 then
			for i = 0, 4, 1 do
				setPropertyFromGroup('playerStrums', i, 'alpha', tonumber(1))
			end
			for i = 0, 4, 1 do
				setPropertyFromGroup('opponentStrums', i, 'alpha', tonumber(1))
			end
			
		elseif type == 0 and duration > 0 then
			noteTweenAlpha("noteGoneOpp1", 0, 1, duration, "quartInOut");
            noteTweenAlpha("noteGoneOpp2", 1, 1, duration, "quartInOut");
            noteTweenAlpha("noteGoneOpp3", 2, 1, duration, "quartInOut");
            noteTweenAlpha("noteGoneOpp4", 3, 1, duration, "quartInOut");
            noteTweenAlpha("noteGone5", 4, 1, duration, "quartInOut");
            noteTweenAlpha("noteGone6", 5, 1, duration, "quartInOut");
            noteTweenAlpha("noteGone7", 6, 1, duration, "quartInOut");
            noteTweenAlpha("noteGone8", 7, 1, duration, "quartInOut");
		end
	end
end