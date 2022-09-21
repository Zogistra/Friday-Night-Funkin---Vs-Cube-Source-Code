local y = 0
local t = 0
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 900; --dad x
local yy = 760; --dad y
local xx2 = 1280; --bf x
local yy2 = 880; --bf y
local ofs = 75;
local followchars = true;
local del = 0;
local del2 = 0;
local drain = 0.01 -- the funne
function onCreatePost()
	doTweenX('bfScaleX', 'boyfriend.scale', 0.55, 0.001)
	doTweenY('bfScaleY', 'boyfriend.scale', 0.55, 0.001)
	setProperty('gf.visible',false)	
end
function onCreate()
	makeLuaSprite('blackScreen', 'white', 0, 0);
	setObjectCamera('blackScreen', 'other');	
	doTweenColor('blackScreenColor', 'blackScreen', '000000', 0.01, 'linear');
	addLuaSprite('blackScreen', true);	
	
	makeLuaSprite('redScreen', 'white', 0, 0);
	setObjectCamera('redScreen', 'other');	
	doTweenColor('redScreenColor', 'redScreen', 'FF0000', 0.01, 'linear');	
	doTweenAlpha('redScreenAlphalmao', 'redScreen', 0, 0.1);			
	addLuaSprite('redScreen', true);	
	
	makeLuaSprite('vignette', 'vignette', 0, 0);
	setObjectCamera('vignette', 'hud');	
	scaleObject('vignette', 0.7, 0.7);	
	doTweenColor('vignetteColor', 'vignette', '3099FC', 0.01, 'linear');	
	doTweenAlpha('vignetteAlpha', 'vignette', 0, 0.01);
	setBlendMode('vignette', 'add');
	addLuaSprite('vignette', true);
	
	makeLuaSprite('border', 'border', 0, 0);
	setObjectCamera('border', 'hud');
	scaleObject('border', 0.7, 0.7);	
	addLuaSprite('border', false);	
	doTweenAlpha('borderAlpha', 'border', 0, 0.001);							
end
function onCountdownTick(counter)
	if counter == 0 then
	playSound('cubeangry_sfx', 1, 'angry')
	doTweenAlpha('redScreenAlphaHi', 'redScreen', 1, 0.1);			
	end	
	if counter == 2 then
	doTweenAlpha('blackScreenAlpha', 'blackScreen', 0, 1);	
	end
end
function onTweenCompleted(tag)
	if tag == 'redScreenAlphaHi' then
	doTweenAlpha('redScreenAlphaBye', 'redScreen', 0, 0.5);
	end		
end
function onBeatHit()
	if curBeat % 2 == 0 then
	triggerEvent('Add Camera Zoom', 0.2, 0.05)	
	end	
	if curBeat % 1 == 0 then
	triggerEvent('Add Camera Zoom', 0.01, 0.025)
	doTweenAlpha('vignetteAlpha +', 'vignette', 1, 0.01);	
	doTweenAlpha('vignetteAlpha -', 'vignette', 0, 0.5);		
	end
end
function onStepHit()
	if curStep == 640 then
	setProperty('whiteBG.alpha', 1);
	setProperty('rain.alpha', 0);
	setProperty('rain2.alpha', 0);
	doTweenAlpha('borderAlpha', 'border', 1, 0.001);	
	doTweenColor('tree', 'tree', '000000', 0.0001);
	doTweenColor('icon1', 'iconP1', '000000', 0.0001);	
	doTweenColor('icon2', 'iconP2', '000000', 0.0001);
	doTweenColor('blackHealth', 'healthBar', '000000', 0.0001);									
	doTweenColor('redImpostorBlack', 'dad', '000000', 0.0001);
	doTweenColor('girlfriendBlack', 'gf', '000000', 0.0001);
	doTweenColor('boyfriendBlack', 'boyfriend', '000000', 0.0001);		
	end
	if curStep == 928 then
	setProperty('whiteBG.alpha', 0);
	setProperty('rain.alpha', 1);
	setProperty('rain2.alpha', 1);
	doTweenAlpha('borderAlpha', 'border', 0, 0.001);	
	doTweenColor('tree', 'tree', 'FFFFFF', 0.0001);
	doTweenColor('icon1', 'iconP1', 'FFFFFF', 0.0001);	
	doTweenColor('icon2', 'iconP2', 'FFFFFF', 0.0001);
	doTweenColor('blackHealth', 'healthBar', 'FFFFFF', 0.0001);		
	doTweenColor('redImpostorBlack', 'dad', 'FFFFFF', 0.0001);
	doTweenColor('girlfriendBlack', 'gf', 'FFFFFF', 0.0001);
	doTweenColor('boyfriendBlack', 'boyfriend', 'FFFFFF', 0.0001);		
	end	
	if curStep == 1376 then
	doTweenAlpha('Uh', 'blackScreen', 1, 0.01);
	end	
	if curStep == 1407 then
	doTweenAlpha('UhBye', 'blackScreen', 0, 0.3);
	triggerEvent('Change Character', 'bf', 'boyfriend_phase2')
	setProperty('boyfriend.y', 550);
	setProperty('boyfriend.x', 1450);
	addLuaSprite('moonup', false);
	doTweenAlpha('planeTwoAlpha+', 'planeTwo', 1, 0.1);
	doTweenAlpha('planeAlpha+', 'planeTwo', 1, 0.1);
	addLuaSprite('cloudsup', true);
	addLuaSprite('bigCloudup', true);	
	addLuaSprite('vwv', true);
	removeLuaSprite('moon', true);
	removeLuaSprite('smallClouds', true);	
	removeLuaSprite('bigClouds', true);	
	removeLuaSprite('mountains', true);		
	removeLuaSprite('water', true);	
	removeLuaSprite('floor', true);	
	removeLuaSprite('shadow', true);	
	removeLuaSprite('tree', true);	
	end		
end	
function onUpdate()
	--Zooms and Tweens
	if mustHitSection == false then --dad
	setProperty('defaultCamZoom', 0.8);
	doTweenX('skyX', 'sky', -100, 0.4);	
	doTweenX('mountainsX', 'mountains', 0, 0.5);	
	doTweenY('moonY', 'moon', 0, 0.4);				
	doTweenY('sCloudsY', 'smallClouds', 0, 0.4);	
	doTweenY('bCloudsY', 'bigClouds', 0, 0.4);	
	end
	if mustHitSection == true then --bf
	setProperty('defaultCamZoom', 0.9);
	doTweenX('skyX', 'sky', 100, 0.4);		
	doTweenX('mountainsX', 'mountains', 300, 0.5);
	doTweenY('moonY', 'moon', 100, 0.4);			
	doTweenY('sCloudsY', 'smallClouds', -100, 0.4);	
	doTweenY('bCloudsY', 'bigClouds', -100, 0.4);		
	end
	--Camera Follow:
	if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end	
end
