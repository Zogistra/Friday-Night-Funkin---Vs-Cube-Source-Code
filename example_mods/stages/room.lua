function onCreate()
	makeLuaSprite('room', 'backgrounds/room/room', -500, 0);
	setScrollFactor('room', 0.9, 0.9);
	addLuaSprite('room', false);
	
	makeLuaSprite('floor', 'backgrounds/room/floor', -500, 1148);
	setScrollFactor('floor', 0.9, 0.9);
	addLuaSprite('floor', false);
	
	makeLuaSprite('table', 'backgrounds/room/table', 898, 776);
	setScrollFactor('table', 1, 0.9);
	addLuaSprite('table', false);	
	
	makeLuaSprite('frame', 'backgrounds/room/frame', 1342, 571);
	setScrollFactor('frame', 0.9, 0.9);
	addLuaSprite('frame', false);
	
	makeAnimatedLuaSprite('window', 'backgrounds/room/window', 0, 328)
	setScrollFactor('window', 0.9, 0.9);		
	addAnimationByPrefix('window', 'idle', 'anim', 24, false)
	addLuaSprite('window', false);
	
	makeAnimatedLuaSprite('clock', 'backgrounds/room/clock', 800, 528)
	setScrollFactor('clock', 0.9, 0.9);		
	scaleObject('clock', 0.6, 0.6);	
	addAnimationByPrefix('clock', 'idle', 'anim', 24, true)
	objectPlayAnimation('clock', 'idle', false)	
	addLuaSprite('clock', false);				
	
	makeLuaSprite('shadow', 'backgrounds/shadow', 200, 0);
	setScrollFactor('shadow', 0.9, 0.9);
	setProperty('shadow.alpha', 0.2)	
	setBlendMode('shadow', 'multiply');
	addLuaSprite('shadow', true);		
	
	makeLuaSprite('bed', 'backgrounds/room/blurred bed', 2121, 348);
	setScrollFactor('bed', 0.9, 0.7);
	scaleObject('bed', 1.2, 1.2);
	addLuaSprite('bed', true);		
	
	makeLuaSprite('light', 'backgrounds/room/light', 921, 0);
	setScrollFactor('light', 0.9, 0.9);
	setBlendMode('light', 'add');	
	doTweenAlpha('lightAlpha+', 'light', 1, 1);
	addLuaSprite('light', true);				
	
	makeLuaSprite('blackScreen', 'white', 0, 0);
	setObjectCamera('blackScreen', 'other');	
	doTweenColor('blackScreenColor', 'blackScreen', '000000', 0.01, 'linear');
	addLuaSprite('blackScreen', true);					
end
function onCreatePost()
	doTweenAlpha('blackScreenTweenAlpha', 'blackScreen', 0, 0.1);	
end
function onTweenCompleted(tag)
	if tag == 'lightAlpha+' then
	doTweenAlpha('lightAlpha-', 'light', 0.5, 1);	
	end
	if tag == 'lightAlpha-' then
	doTweenAlpha('lightAlpha+', 'light', 1, 1);	
	end
end
function onBeatHit()
	if curBeat % 2 == 0 then
	objectPlayAnimation('window', 'idle', false)	
	end
end		
