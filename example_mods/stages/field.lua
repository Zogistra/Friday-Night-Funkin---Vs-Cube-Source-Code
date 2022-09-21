function onCreate()
	makeLuaSprite('sky', 'backgrounds/field/sky', 0, 0);
	setScrollFactor('sky', 0.9, 0.9);	
	addLuaSprite('sky', false);	
	
	makeLuaSprite('clouds', 'backgrounds/field/clouds', 347, 71);
	setScrollFactor('clouds', 0.9, 0.9);	
	addLuaSprite('clouds', false);													
	
	makeLuaSprite('city', 'backgrounds/field/city', 0, 0);
	setScrollFactor('city', 0.9, 0.9);	
	addLuaSprite('city', false);	

	for i = 0, 4 do
	makeLuaSprite('win'..i, 'backgrounds/field/win'..i, 0, 0);
	setScrollFactor('win'..i, 0.9, 0.9);	
	setProperty('win'..i..'.visible', false);
	addLuaSprite('win'..i, false);									
	
	makeLuaSprite('grass', 'backgrounds/field/grass', 0, 930);
	setScrollFactor('grass', 0.9, 0.9);	
	addLuaSprite('grass', false);	
	
	makeLuaSprite('car', 'backgrounds/field/car', 680, 800);	
	setScrollFactor('car', 0.9, 0.9);
	scaleObject('car', 0.5, 0.5);	
	doTweenAngle('carAngle', 'car', -10, 0.01)
	addLuaSprite('car', false);								

	makeLuaSprite('trees', 'backgrounds/field/trees', 283, 0);	
	setScrollFactor('trees', 0.9, 0.9);	
	addLuaSprite('trees', false);	
	
	makeLuaSprite('people', 'backgrounds/field/peopleBlurred', 1000, 1000);	
	setScrollFactor('people', 1, 0.7);	
	scaleObject('people', 1.2, 1.2);		
	addLuaSprite('people', true);								
	
	makeLuaSprite('blacker', 'white', 0, 0);
	scaleObject('blacker', 1.5, 1.5);
	doTweenColor('blackerColor', 'blacker', '000000', 0.01);
	addLuaSprite('blacker', false);
	
	makeLuaSprite('blackscreen2', 'white', 0, 0);
	scaleObject('blackscreen2', 1.5, 1.5);
	doTweenColor('blackscreen2c', 'blackscreen2', '000000', 0.01);
	doTweenAlpha('blackscreen2a', 'blackscreen2', 0, 0.001);
	addLuaSprite('blackscreen2', false);		
	end											
end
curLight = 0;
function onUpdate(elapsed)
	setProperty('win'..curLight..'.alpha', getProperty('win'..curLight..'.alpha') - (crochet / 1000) * elapsed * 1.5);	
end

function onBeatHit()
	if curBeat % 2 == 0 then
		for i = 0, 4 do
			setProperty('win'..i..'.visible', false)
		end

		curLight = math.random(0, 4);
		setProperty('win'..curLight..'.visible', true)
		setProperty('win'..curLight..'.alpha', 1)
	end
end
