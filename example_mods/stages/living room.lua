function onCreate()
	makeLuaSprite('wall', 'backgrounds/livingroom/wall', 0, 0);
	setScrollFactor('wall', 0.9, 0.9);
	addLuaSprite('wall', false);
	
	makeLuaSprite('floor', 'backgrounds/livingroom/floor', 0, 1324);
	setScrollFactor('floor', 0.9, 0.9);
	addLuaSprite('floor', false);
	
	makeLuaSprite('window', 'backgrounds/livingroom/window', 2649, 581);
	setScrollFactor('window', 0.9, 0.9);
	addLuaSprite('window', false);
	
	makeLuaSprite('door', 'backgrounds/livingroom/door', 391, 629);
	setScrollFactor('door', 0.9, 0.9);
	addLuaSprite('door', false);	
	
	makeLuaSprite('door-i', 'backgrounds/livingroom/door-impostor', 391, 629);
	setScrollFactor('door-i', 0.9, 0.9);
	setProperty('door-i.alpha', 0);
	addLuaSprite('door-i', false);
	
	makeLuaSprite('frame', 'backgrounds/livingroom/frame', 1249, 598);
	setScrollFactor('frame', 0.9, 0.9);
	addLuaSprite('frame', false);
	
	makeLuaSprite('armchair', 'backgrounds/livingroom/armchair', 1650, 951);
	setScrollFactor('armchair', 0.9, 0.9);
	addLuaSprite('armchair', false);
	
	makeLuaSprite('table', 'backgrounds/livingroom/table', 1350, 1170);
	setScrollFactor('table', 0.9, 0.9);
	addLuaSprite('table', false);
	
	makeLuaSprite('lamp', 'backgrounds/livingroom/lamp', 1484, 0);
	setScrollFactor('lamp', 0.9, 0.9);
	addLuaSprite('lamp', true);	
	
	makeLuaSprite('blur-table', 'backgrounds/livingroom/blur-table', 1726, 1388);
	setScrollFactor('blur-table', 0.9, 0.9);
	addLuaSprite('blur-table', true);
		
	makeLuaSprite('blur-tv', 'backgrounds/livingroom/blur-tv', 1722, 1307);
	setScrollFactor('blur-tv', 0.9, 0.9);
	addLuaSprite('blur-tv', true);								
	
	makeAnimatedLuaSprite('warning', 'backgrounds/livingroom/warning', 1860, 728)
	setScrollFactor('warning', 0.9, 0.9);		
	addAnimationByPrefix('warning', 'error', 'NORMAL', 24, false)
	addAnimationByPrefix('warning', 'critical-error', 'WARNING!!!', 24, false)
	addLuaSprite('warning', false);			
	
	makeAnimatedLuaSprite('clock', 'backgrounds/livingroom/clock', 2300, 720)
	setScrollFactor('clock', 0.9, 0.9);		
	scaleObject('clock', 0.6, 0.6);	
	addAnimationByPrefix('clock', 'idle', 'anim', 72, true)
	objectPlayAnimation('clock', 'idle', false)	
	addLuaSprite('clock', false);			
	
				--EFFECTS--
	makeLuaSprite('Red', 'white', 0, 0);
	setObjectCamera('Red', 'hud');		
	doTweenColor('RedColor', 'Red', 'FF0000', 0.01, 'linear');	
	doTweenAlpha('RedAlpha', 'Red', 0, 0.01);			
	addLuaSprite('Red', true);		
	
	makeLuaSprite('vignetteRed', 'vignette', 0, 0);
	setObjectCamera('vignetteRed', 'hud');	
	scaleObject('vignetteRed', 0.7, 0.7);	
	doTweenColor('vignetteRedColor', 'vignetteRed', 'FF0000', 0.01, 'linear');	
	doTweenAlpha('vignetteRedAlpha', 'vignetteRed', 0, 0.01);			
	addLuaSprite('vignetteRed', true);			
end
function onBeatHit()
	if curBeat % 1 == 0 then
	objectPlayAnimation('warning', 'error', false)		
	end
end	
