function onCreatePost()
	setProperty('timeBar.x', 140)
	setProperty('scoreTxt.visible', false);	
	makeLuaText('newGUI','', screenWidth, getProperty('scoreTxt.x'), getProperty('scoreTxt.y'));
	setTextSize('newGUI', textSize);
	setTextAlignment('newGUI', 'center');
	setObjectCamera('newGUI', 'hud');	

	if fontEnabled == true then
		setTextFont('newGUI', textFont);
	end
	
	if hudText == true then
		addLuaText('newGUI');
	end
end

function opponentNoteHit()
       health = getProperty('health')
    if getProperty('health') > 0.1 then --limit
       setProperty('health', health- 0.025); --damage
	end
end

function onBeatHit()
    if curBeat % 1 == 0 then
        setProperty('iconP2.angle', 20);
        doTweenAngle('bip', 'iconP2', 5, 0.4, 'cubicOut');

        setProperty('iconP1.angle', 20);
        doTweenAngle('bop', 'iconP1', 5, 0.4, 'cubicOut');
    end
    if curBeat % 2 == 0 then
	setProperty('iconP2.angle', -20);
	doTweenAngle('bip', 'iconP2', 5, 0.4, 'cubicOut');

	setProperty('iconP1.angle', -20);
	doTweenAngle('bop', 'iconP1', 5, 0.4, 'cubicOut');
    end
end
function onCreate()
    
	setPropertyFromClass('GameOverSubstate', 'characterName', 'boyfriend_loses'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'explode_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOverCube'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverCubeEnd'); --put in mods/music/
end
function onCountdownTick(counter)
	if counter == 0 then
	playSound('scratch_sfx', 1, 'e0')
	end
	if counter == 1 then
	playSound('scratch_sfx', 1, 'e1')
	end
	if counter == 2 then
	playSound('scratch_sfx', 1, 'e2')
	end    
	if counter == 3 then
	playSound('barrel_sfx', 1, 'e4')
	playSound('scratch_sfx', 1, 'e3')
	characterPlayAnim('boyfriend', 'hey', true)
	characterPlayAnim('gf', 'cheer', true)
	triggerEvent('Flash', '2', '1')
    end   
end

hudText = true	--if the text with score accuracy and misses is on, in case you just want opponent note moving

songNameOnHUD = false --able to turn on and off for clearer HUD

textSize = 20 --Text Size [DEFAULT = 20]

fontEnabled = false --Fonts Enabled [set to 'false' for default]

textFont = vcr --Text Font [set 'fontEnabled' to 'false' if you dont want a font]

notePositionChange = true	--change to false if you dont want the notes to move, true makes the notes move

timer = false	--if true, a timer will delay the opponent's note changes, if false then it will change on go

howLongTillNoteChange = 1.7	--the delay for the note change (will only take effect if 'timer' is true)

noteChangeSpeed = 0.1	--the speed of opponent's note moving ('timer' has to be true)
function onUpdate()
	if hudText == true then
	
		-- Normal Mode --
	
		setTextString('newGUI','Score: ' ..score.. ' | Accuracy: ' ..math.floor(rating * 100).. '% | Misses: ' ..getProperty('songMisses').. ' | Combo: ' ..getProperty('combo').. ' | Health: '..math.floor(getProperty('health') * 500 / 10).. '%', screenWidth, getProperty('scoreTxt.x'), getProperty('scoreTxt.y'));
	
		if getProperty('songMisses') == 0 and getProperty('combo') > 0 then
			setTextString('newGUI','Score: ' ..score.. ' | Accuracy: ' ..math.floor(rating * 100).. '% | Full Combo - ' ..getProperty('combo').. ' | Health: '..math.floor(getProperty('health') * 500 / 10).. '%', screenWidth, getProperty('scoreTxt.x'), getProperty('scoreTxt.y'));
		end
	
		if botPlay == true then
			setProperty('botplayTxt.visible', false);
			setTextString('newGUI', 'CUBEPLAY: ON | Combo: ' ..getProperty('combo').. ' | Health: '..math.floor(getProperty('health') * 500 / 10).. '%', screenWidth, getProperty('scoreTxt.x'), getProperty('scoreTxt.y'));
		end
		
		if math.floor(rating * 100) == 0 and botPlay == false then
			setTextString('newGUI','Score: ' ..score.. ' | Accuracy: ? | Misses: ' ..getProperty('songMisses').. ' | Combo: ' ..getProperty('combo').. ' | Health: '..math.floor(getProperty('health') * 500 / 10).. '%', screenWidth, getProperty('scoreTxt.x'), getProperty('scoreTxt.y'));
		end
		
		-- Song on HUD --
		
		if songNameOnHUD == true then
			setTextString('newGUI','Score: ' ..score.. ' | Accuracy: ' ..math.floor(rating * 100).. '% | Misses: ' ..getProperty('songMisses').. ' | Combo: ' ..getProperty('combo').. ' | Health: '..math.floor(getProperty('health') * 500 / 10).. '% | Song: ' ..songName, screenWidth, getProperty('scoreTxt.x'), getProperty('scoreTxt.y'));
	
			if getProperty('songMisses') == 0 and getProperty('combo') > 0 then
				setTextString('newGUI','Score: ' ..score.. ' | Accuracy: ' ..math.floor(rating * 100).. '% | Full Combo - ' ..getProperty('combo').. ' | Health: '..math.floor(getProperty('health') * 500 / 10).. '% | Song: ' ..songName, screenWidth, getProperty('scoreTxt.x'), getProperty('scoreTxt.y'));
			end
	
			if botPlay == true then
				setProperty('botplayTxt.visible', false);
				setTextString('newGUI', 'BOTPLAY: ON | Combo: ' ..getProperty('combo').. ' | Health: '..math.floor(getProperty('health') * 500 / 10).. '% | Song: ' ..songName, screenWidth, getProperty('scoreTxt.x'), getProperty('scoreTxt.y'));
			end
		
			if math.floor(rating * 100) == 0 and botPlay == false then
				setTextString('newGUI','Score: ' ..score.. ' | Accuracy: ? | Misses: ' ..getProperty('songMisses').. ' | Combo: ' ..getProperty('combo').. ' | Health: '..math.floor(getProperty('health') * 500 / 10).. '% | Song: ' ..songName, screenWidth, getProperty('scoreTxt.x'), getProperty('scoreTxt.y'));
			end
		end
	end
end     
