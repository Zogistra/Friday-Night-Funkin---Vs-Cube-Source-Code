--Script made by TailsTeZ yeee				
function onEvent(name, value1, value2)
	if name == 'Vignette' then	
		duration = tonumber(value1);	
		color = tonumber(value2);
		if color == 0 then
			makeLuaSprite('vig0', 'vignette', 0, 0);
			setObjectCamera('vig0', 'hud');	
			scaleObject('vig0', 0.7, 0.7);
			addLuaSprite('vig0', true);
			setBlendMode('vig0', 'add');
			doTweenColor('whiteVignette', 'vig0', 'FFFFFF', 0.0001);				
			doTweenAlpha('whiteVignetteInvisible', 'vig0', 0, duration);				
		end
		if color == 1 then
			makeLuaSprite('vig1', 'vignette', 0, 0);
			setObjectCamera('vig1', 'hud');	
			scaleObject('vig1', 0.7, 0.7);
			addLuaSprite('vig1', true);		
			doTweenColor('blackVignette', 'vig1', '000000', 0.0001);			
			doTweenAlpha('blackVignetteInvisible', 'vig1', 0, duration);			
		end
		if color == 2 then
			makeLuaSprite('vig2', 'vignette', 0, 0);
			setObjectCamera('vig2', 'hud');	
			scaleObject('vig2', 0.7, 0.7);
			addLuaSprite('vig2', true);	
			setBlendMode('vig2', 'add');
			doTweenColor('redVignette', 'vig2', 'FF0000', 0.0001);			
			doTweenAlpha('redVignetteInvisible', 'vig2', 0, duration);			
		end
		if color == 3 then
			makeLuaSprite('vig3', 'vignette', 0, 0);
			setObjectCamera('vig3', 'hud');	
			scaleObject('vig3', 0.7, 0.7);	
			addLuaSprite('vig3', true);	
			setBlendMode('vig3', 'add');
			doTweenColor('greenVignette', 'vig3', '00FF00', 0.0001);				
			doTweenAlpha('greenVignetteInvisible', 'vig3', 0, duration);			
		end
		if color == 4 then
			makeLuaSprite('vig4', 'vignette', 0, 0);
			setObjectCamera('vig4', 'hud');	
			scaleObject('vig4', 0.7, 0.7);
			addLuaSprite('vig4', true);
			setBlendMode('vig4', 'add');	
			doTweenColor('blueVignette', 'vig4', '0000FF', 0.0001);				
			doTweenAlpha('blueVignetteInvisible', 'vig4', 0, duration);			
		end
		if color == 5 then
			makeLuaSprite('vig5', 'vignette', 0, 0);
			setObjectCamera('vig5', 'hud');	
			scaleObject('vig5', 0.7, 0.7);
			addLuaSprite('vig5', true);
			setBlendMode('vig5', 'add');	
			doTweenColor('lightBlueVignette', 'vig5', '0092FB', 0.0001);			
			doTweenAlpha('lightBlueVignetteInvisible', 'vig5', 0, duration);			
		end
		if color == 6 then
			makeLuaSprite('vig6', 'vignette', 0, 0);
			setObjectCamera('vig6', 'hud');	
			scaleObject('vig6', 0.7, 0.7);	
			addLuaSprite('vig6', true);
			setBlendMode('vig6', 'add');	
			doTweenColor('yellowVignette', 'vig6', 'FFFF00', 0.0001);			
			doTweenAlpha('yellowVignetteInvisible', 'vig6', 0, duration);			
		end
		if color == 7 then
			makeLuaSprite('vig7', 'vignette', 0, 0);
			setObjectCamera('vig7', 'hud');	
			scaleObject('vig7', 0.7, 0.7);
			addLuaSprite('vig7', true);	
			setBlendMode('vig7', 'add');
			doTweenColor('pinkVignette', 'vig7', 'FB00B7', 0.0001);			
			doTweenAlpha('pinkVignetteInvisible', 'vig7', 0, duration);			
		end
		if color == 8 then
			makeLuaSprite('vig8', 'vignette', 0, 0);
			setObjectCamera('vig8', 'hud');	
			scaleObject('vig8', 0.7, 0.7);
			addLuaSprite('vig8', true);	
			setBlendMode('vig8', 'add');
			doTweenColor('orangeVignette', 'vig8', 'FFA500', 0.0001);				
			doTweenAlpha('orangeVignetteInvisible', 'vig8', 0, duration);			
		end
		if color == 9 then
			makeLuaSprite('vig9', 'vignette', 0, 0);
			setObjectCamera('vig9', 'hud');	
			scaleObject('vig9', 0.7, 0.7);	
			addLuaSprite('vig9', true);	
			setBlendMode('vig9', 'add');
			doTweenColor('purpleVignette', 'vig9', '8300FF', 0.0001);			
			doTweenAlpha('purpleVignetteInvisible', 'vig9', 0, duration);			
		end
		end											
end
