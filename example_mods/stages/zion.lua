function onCreate()
	makeLuaSprite('sky', 'backgrounds/zion/sky', -600, 0);
	setScrollFactor('sky', 0.9, 0.9);
	doTweenColor('skyDay', 'sky', '3099FC', 0.01, 'linear');	
	addLuaSprite('sky', false);
	
	makeLuaSprite('nightGlow', 'backgrounds/zion/nightGlow', 0, 820);
	setScrollFactor('nightGlow', 0.9, 0.9);
	doTweenAlpha('nightGlowAlpha', 'nightGlow', 0, 0.01);
	setBlendMode('nightGlow','add')		
	addLuaSprite('nightGlow', false);	
	
	makeLuaSprite('sun', 'backgrounds/zion/sun', 1569, 502);
	setScrollFactor('sun', 0.6, 0.9);
	scaleObject('sun', 0.8, 0.8);
	addLuaSprite('sun', false);	
	
	makeLuaSprite('moon', 'backgrounds/zion/moon', 1569, 502);
	setScrollFactor('moon', 0.6, 0.9);
	scaleObject('moon', 0.8, 0.8);
	doTweenAlpha('moonAlpha', 'moon', 0, 0.01);
	setBlendMode('moon','add')		
	addLuaSprite('moon', false);
	
	makeLuaSprite('mountains', 'backgrounds/zion/mountains', -600, 208);
	setScrollFactor('mountains', 0.9, 0.9);
	doTweenAngle('mountains +', 'mountains', 2, 2.5)	
	addLuaSprite('mountains', false);
	
	makeLuaSprite('clouds', 'backgrounds/zion/clouds', 241, 643);
	setScrollFactor('clouds', 0.7, 0.9);
	doTweenAngle('clouds -', 'clouds', -10, 5)	
	addLuaSprite('clouds', false);
	
	makeAnimatedLuaSprite('boom', 'backgrounds/zion/burst', 900, 450);
	addAnimationByPrefix('boom', 'idle', 'boom!', 12, false);
	setScrollFactor('boom', 0.9, 0.9);
	doTweenAlpha('boom-', 'boom', 0, 0.001);
	addLuaSprite('boom', false);
	
	makeLuaSprite('grass', 'backgrounds/zion/grass', -600, 1403);
	setScrollFactor('grass', 0.9, 0.9);
	addLuaSprite('grass', false);
	makeLuaSprite('leftCubes', 'backgrounds/zion/leftCubes', 167, 1333);
	setScrollFactor('leftCubes', 0.9, 0.9);
	scaleObject('leftCubes', 0.8, 0.8);		
	addLuaSprite('leftCubes', false);
	
	makeLuaSprite('rightCubes', 'backgrounds/zion/rightCubes', 1788, 1333);
	setScrollFactor('rightCubes', 0.9, 0.9);
	scaleObject('rightCubes', 0.8, 0.8);			
	addLuaSprite('rightCubes', false);	
	
	makeLuaSprite('leftCubesEyes', 'backgrounds/zion/leftCubesEyes', 205, 1300);
	setScrollFactor('leftCubesEyes', 0.9, 0.9);
	scaleObject('leftCubesEyes', 0.8, 0.8);
	doTweenAlpha('leftCubesEyesAlpha', 'leftCubesEyes', 0, 0.01);
	setBlendMode('leftCubesEyes','add')			
	addLuaSprite('leftCubesEyes', false);	

	makeLuaSprite('rightCubesEyes', 'backgrounds/zion/rightCubesEyes', 1740, 1306);
	setScrollFactor('rightCubesEyes', 0.9, 0.9);
	scaleObject('rightCubesEyes', 0.8, 0.8);	
	doTweenAlpha('rightCubesEyesAlpha', 'rightCubesEyes', 0, 0.01);
	setBlendMode('rightCubesEyes','add')	
	addLuaSprite('rightCubesEyes', false);		
			
	makeLuaSprite('playersO', 'backgrounds/zion/players_others', 200, 1750);
	setScrollFactor('playersO', 0.9, 0.9);
	scaleObject('playersO', 0.8, 0.8);			
	addLuaSprite('playersO', true);
	
	makeLuaSprite('tree', 'backgrounds/zion/tree', 400, 418);
	setScrollFactor('tree', 2, 0.9);
	addLuaSprite('tree', true);				
end
function onUpdate()
	if mustHitSection == false then
		doTweenX('playersO XF', 'playersO', 200, 0.3);	 
	end
	if mustHitSection == true then
		doTweenX('playersO XT', 'playersO', 600, 0.3);	 
	end 
end
function onSongStart()
	doTweenY('rightCubes Yy', 'rightCubes', 1283, 0.1)
	doTweenY('leftCubes Yy', 'leftCubes', 1283, 0.1)
	doTweenY('rightCubesEyes Yy', 'rightCubesEyes', 1256, 0.1)
	doTweenY('leftCubesEyes Yy', 'leftCubesEyes', 1250, 0.1)	
	doTweenY('playersO Yy', 'playersO', 1700, 0.1)					
end
function onTweenCompleted(tag)
	if tag == 'clouds -' then
	doTweenAngle('clouds +', 'clouds', 10, 5)	
	end
	if tag == 'clouds +' then
	doTweenAngle('clouds -', 'clouds', -10, 5)	
	end	
	if tag == 'mountains +' then
	doTweenAngle('mountains -', 'mountains', -2, 2.5)
	end
	if tag == 'mountains -' then
	doTweenAngle('mountains +', 'mountains', 2, 2.5)	
	end	
	if tag == 'playersO Yy' then	
	doTweenY('playersO Y', 'playersO', 1750, 0.6)
	end	
	if tag == 'playersO Y' then	
	doTweenY('playersO Yy', 'playersO', 1700, 0.1)
	end		
	if tag == 'rightCubes Yy' then	
	doTweenY('rightCubes Y', 'rightCubes', 1333, 0.6)
	end	
	if tag == 'rightCubes Y' then	
	doTweenY('rightCubes Yy', 'rightCubes', 1283, 0.1)	
	end	
	if tag == 'leftCubes Yy' then	
	doTweenY('leftCubes Y', 'leftCubes', 1333, 0.6)
	end	
	if tag == 'leftCubes Y' then	
	doTweenY('leftCubes Yy', 'leftCubes', 1283, 0.1)
	end
	if tag == 'rightCubesEyes Yy' then	
	doTweenY('rightCubesEyes Y', 'rightCubesEyes', 1306, 0.6)
	end	
	if tag == 'rightCubesEyes Y' then	
	doTweenY('rightCubesEyes Yy', 'rightCubesEyes', 1256, 0.1)	
	end	
	if tag == 'leftCubesEyes Yy' then	
	doTweenY('leftCubesEyes Y', 'leftCubesEyes', 1300, 0.6)
	end	
	if tag == 'leftCubesEyes Y' then	
	doTweenY('leftCubesEyes Yy', 'leftCubesEyes', 1250, 0.1)
	end								
end
