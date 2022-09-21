function onCreate()
	makeAnimatedLuaSprite('boifren', 'characters/Boyfriend_Zero', 2040, 1400);
	addAnimationByPrefix('boifren', 'idle', 'idle', 24, true);
	addLuaSprite('boifren', false);
	setProperty('boifren.alpha', 0);
end
function onStepHit()
	if curStep == 384 then --384
		setProperty('defaultCamZoom', 0.45)
		triggerEvent('Screen Shake', '0.1, 0.3', '')
		setProperty('boifren.alpha', 1);
	end
	if curStep == 380 then
		objectPlayAnimation('boom', 'idle', false);
		doTweenAlpha('boom!!!', 'boom', 1, 0.01);
		doTweenAlpha('boombye', 'boom', 0, 0.5);	
	end
	if curStep == 656 then
		setProperty('defaultCamZoom', 0.63)
		setProperty('boifren.alpha', 0);
		doTweenColor('boyfriendNight', 'boyfriend', 'A8CCDE', 0.001);
		doTweenColor('nightHi', 'sky', '002153', 0.001);
		doTweenAlpha('NGHi', 'nightGlow', 1, 0.001);
		doTweenAlpha('moonHu', 'moon', 1, 0.001);	
		doTweenAlpha('sunBye', 'sun', 0, 0.001);	
		doTweenAlpha('RCEHi', 'rightCubesEyes', 1, 0.001);
		doTweenAlpha('LCEHi', 'leftCubesEyes', 1, 0.001);
	end
end		
function onBeatHit()
	if curBeat % 2 == 0 then
	objectPlayAnimation('boifren', 'idle', false);
	triggerEvent('Add Camera Zoom', 0.1, 0.1)
	end
	if curBeat == 96 then
	doTweenAngle('moveCamGameQ', 'camGame', -5, 2)
	doTweenAngle('moveCamHUDQ', 'camHUD', -5, 2)
	end
	if curBeat == 160 then
	doTweenAngle('camGDefault2', 'camGame', 0, 0.001)
	doTweenAngle('camHUDDefault2', 'camHUD', 0, 0.001)
	triggerEvent('Screen Shake', '0.1, 0.5', '0.1, 0.5');
	cancelTween('moveCamHUDQ')
	cancelTween('moveCamHUDQ1')
	cancelTween('moveCamGameQ')
	cancelTween('moveCamGameQ1')
	end
end		
function onTweenCompleted(tag)
    if tag == 'moveCamGameQ' then
    doTweenAngle('moveCamGameQ1', 'camGame', 5, 2)   
    end
    if  tag == 'moveCamGameQ1' then
    doTweenAngle('moveCamGameQ', 'camGame', -5, 2)   
    end
    if tag == 'moveCamHUDQ' then
    doTweenAngle('moveCamHUDQ1', 'camHUD', 5, 2)   
    end
    if  tag == 'moveCamHUDQ1' then
    doTweenAngle('moveCamHUDQ', 'camHUD', -5, 2)   
    end
end