function onCreate()
	--DOWN:
	makeLuaSprite('sky', 'backgrounds/mountains/sky', -100, 0);
	addLuaSprite('sky', false);
	
	makeLuaSprite('moon', 'backgrounds/mountains/moon', 256, 129);
	setScrollFactor('moon', 1.1, 1.1);	
	addLuaSprite('moon', false);
	
	makeLuaSprite('smallClouds', 'backgrounds/mountains/smallClouds', 0, 0);
	setScrollFactor('smallClouds', 1.1, 1.1);
	doTweenX('smallLeft', 'smallClouds', -500, 8);
	addLuaSprite('smallClouds', false);
	
	makeLuaSprite('bigClouds', 'backgrounds/mountains/bigClouds', 0, 0);
	setScrollFactor('bigClouds', 1.1, 1.1);
	doTweenX('bigRight', 'bigClouds', 400, 12)	
	addLuaSprite('bigClouds', false);
	
	makeLuaSprite('lightning1', 'backgrounds/mountains/lightning', 400, 100);
	scaleObject('lightning1', 0.5, 0.5);
	setBlendMode('lightning1','add');	
	doTweenAlpha('lightning1Alpha', 'lightning1', 0, 0.001);			
	addLuaSprite('lightning1', false);	
	
	makeLuaSprite('mountains', 'backgrounds/mountains/mountains', 0, 533);
	setScrollFactor('mountains', 1.4, 1.2);
	addLuaSprite('mountains', false);	
	
	makeAnimatedLuaSprite('water', 'backgrounds/mountains/water', -100, 930)
	addAnimationByPrefix('water', 'idle', 'anim', 10, true)
	objectPlayAnimation('water', 'idle', false)
	setScrollFactor('water', 1.1, 1.1);
	setProperty('water.alpha', 0.8);	
	addLuaSprite('water', false);		
	
	makeLuaSprite('floor', 'backgrounds/mountains/floor', 985, 943);
	setScrollFactor('floor', 1.1, 1.1);
	addLuaSprite('floor', false);	
	
	makeLuaSprite('tree', 'backgrounds/mountains/tree', 1457, -88);
	setScrollFactor('tree', 1.1, 1.1);
	doTweenAngle('treeAngle', 'tree', -20, 0.1)	
	addLuaSprite('tree', true);		
	
	
	--UP:	
	makeLuaSprite('moonup', 'backgrounds/mountains/moon', 718, 234);
	scaleObject('moonup', 0.4, 0.4);				
	setScrollFactor('moonup', 1.2, 0.9);
	
	makeLuaSprite('plane', 'backgrounds/mountains/plane', 50, 315);
	setScrollFactor('plane', 0.9, 0.9);
	scaleObject('plane', 0.2, 0.2);	
	addLuaSprite('plane', false);
	doTweenAlpha('planeAlphaBye', 'plane', 0, 0.1);		
	doTweenX('PlaneStart', 'plane', -500, 0.1);	
	
	makeLuaSprite('planeTwo', 'backgrounds/mountains/planeTwo', 0, 800);
	setScrollFactor('planeTwo', 0.9, 0.9);	
	addLuaSprite('planeTwo', true);
	setBlendMode('planeTwo','add');		
	doTweenAlpha('planeTwoAlphaBye', 'planeTwo', 0, 0.1);		
	doTweenX('PlaneStartTwo', 'planeTwo', 50000, 0.1);					
	
	makeLuaSprite('bigCloudup', 'backgrounds/mountains/bigCloud', 2200, 780);
	setScrollFactor('bigCloudup', 0.9, 0.9);
	scaleObject('bigCloudup', 1.3, 1.3);	
	setBlendMode('bigCloudup','add');		
	doTweenX('bigCloudStart', 'bigCloudup', 2220.1, 0.01);			
	
	makeLuaSprite('cloudsup', 'backgrounds/mountains/clouds', -100, 0);
	scaleObject('cloudsup', 0.9, 0.9);			
	setScrollFactor('cloudsup', 0.9, 0.9);
	doTweenAngle('cloudsUpAngle', 'cloudsup', 0, 2)		
	
	makeAnimatedLuaSprite('rain', 'backgrounds/mountains/rain', 0, 0);
	addAnimationByPrefix('rain', 'idle', 'rain', 24, true);
	objectPlayAnimation('rain', 'idle', false);	
	setObjectCamera('rain', 'other');
	scaleObject('rain', 0.7, 0.7);
	setBlendMode('rain','add');		
	addLuaSprite('rain', false);
	
	makeAnimatedLuaSprite('rain2', 'backgrounds/mountains/rain2', 0, 0);
	addAnimationByPrefix('rain2', 'idle', 'rain', 24, true);
	objectPlayAnimation('rain2', 'idle', false);	
	setObjectCamera('rain2', 'other');
	scaleObject('rain2', 0.7, 0.7);
	setBlendMode('rain2','add');	
	setProperty('rain2.alpha', 0.8);
	addLuaSprite('rain2', false);
	
	makeLuaSprite('lightning', 'backgrounds/mountains/lightning', 850, 150);
	scaleObject('lightning', 0.8, 0.8);
	setBlendMode('lightning','add');	
	doTweenAlpha('lightningAlpha', 'lightning', 0, 0.001);			
	addLuaSprite('lightning', true);
	
	makeAnimatedLuaSprite('light', 'backgrounds/mountains/lightningVignette', 0, 0);
	addAnimationByPrefix('light', 'idle', 'light', 24, true);
	objectPlayAnimation('light', 'light', false);
	setObjectCamera('light', 'hud');
	scaleObject('light', 0.7, 0.7);
	setBlendMode('light','add');
	doTweenAlpha('lightAlpha', 'light', 0, 0.001);
	addLuaSprite('light', true);
	
	makeLuaSprite('whiteBG', 'white', -500, 0);
	scaleObject('whiteBG', 2, 2);	
	setProperty('whiteBG.alpha', 0);		
	addLuaSprite('whiteBG', false);	
end

function onTweenCompleted(tag)
     if tag == 'smallLeft' then
	doTweenX('smallRight', 'smallClouds', 500, 8)
	end
     if tag == 'smallRight' then
	doTweenX('smallLeft', 'smallClouds', -500, 8)
	end
     if tag == 'bigRight' then
	doTweenX('bigLeft', 'bigClouds', -400, 12)
	end
     if tag == 'bigLeft' then
	doTweenX('bigRight', 'bigClouds', 400, 12)
	end
     if tag == 'PlaneStart' then
	doTweenX('Plane+', 'plane', 2100, 24);					
	end
     if tag == 'Plane+' then
	doTweenX('Plane-', 'plane', -2100, 0.01);
	end 
     if tag == 'Plane-' then
	doTweenX('Plane+', 'plane', 2100, 24);
	end  
     if tag == 'PlaneStartTwo' then
	doTweenX('PlaneTwo+', 'planeTwo', -50000, 10);
	playSound('plane_sfx', 1, 'plane_sfx')		
	end
     if tag == 'PlaneTwo+' then
	doTweenX('PlaneTwo-', 'planeTwo', 50000, 0.01);		
	end 
     if tag == 'PlaneTwo-' then
	doTweenX('PlaneTwo+', 'planeTwo', -50000, 10);
	playSound('plane_sfx', 1, 'plane_sfx')			
	end  
     if tag == 'bigCloudStart' then
	doTweenX('bigCloudLeft', 'bigCloudup', 2200, 24);							
	end
     if tag == 'bigCloudLeft' then
	doTweenX('bigCloudRight', 'bigCloudup', -2200, 24);						
	end  
     if tag == 'bigCloudRight' then
	doTweenX('bigCloudLeft', 'bigCloudup', 2200, 24);					
	end                        
     if tag == 'cloudsUpAngle' then
	doTweenAngle('cloudsUpAngle-', 'cloudsup', -2, 2)
	end
     if tag == 'cloudsUpAngle-' then
	doTweenAngle('cloudsUpAngle+', 'cloudsup', 2, 2)
	end
     if tag == 'cloudsUpAngle+' then
	doTweenAngle('cloudsUpAngle-', 'cloudsup', -2, 2)
	end				
end
