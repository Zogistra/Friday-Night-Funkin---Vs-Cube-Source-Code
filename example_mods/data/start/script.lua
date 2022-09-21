local y = 50
local t = 0
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 2200; --dad x
local yy = 850; --dad y
local xx2 = 2500; --bf x
local yy2 = 1000; --bf y
local ofs = 75;
local followchars = true;
local del = 0;
local del2 = 0;
local drain = 0.01 -- the funne
function onUpdate()
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
function onCreatePost()
	setProperty('newGUI.alpha', 0);
	setProperty('healthBar.alpha', 0);
	setProperty('iconP1.alpha', 0);
	setProperty('iconP2.alpha', 0);	
	doTweenAlpha('camHUD', 'camHUD', 0, 0.01);
	doTweenAlpha('girlfriendAlpha 0', 'dad', 0, 0.01)	
end
function onCreate()
	makeLuaSprite('blackScreen', 'white', 0, 0);
	setObjectCamera('blackScreen', 'other');	
	doTweenColor('blackScreenColor', 'blackScreen', '000000', 0.01);
	addLuaSprite('blackScreen', true);	
	
	doTweenAlpha('vignetteBFAlpha0', 'vignette', 0, 0.01);
	doTweenAlpha('vignetteGFAlpha0', 'vignette', 0, 0.01);
	
	makeLuaSprite('border', 'border', 0, -80);
	setObjectCamera('border', 'hud');
	scaleObject('border', 0.8, 0.8);
	doTweenY('borderBye', 'border.scale', 0.8, 0.001)
	addLuaSprite('border', false);			
end
function onStepHit()
	if curStep == 16 then
	doTweenAlpha('blackScreenAlpha 0', 'blackScreen', 0, 12);			
	end
	if curStep == 112 then
	doTweenY('people Y -', 'people', 900, 0.1)		
	doTweenAlpha('camHUD', 'camHUD', 1, 2);	
	doTweenAlpha('blackerAlpha 0', 'blacker', 0, 2);
	doTweenAlpha('girlfriendAlpha 1', 'dad', 1, 1.5)
	end
	if curStep == 512 then
	doTweenAlpha('blackscreen2a+', 'blackscreen2', 0.8, 0.5);	
	end
end
function onTweenCompleted(tag)
	if tag == 'people Y -' then
	doTweenY('people Y +', 'people', 950, 0.5)		
	end
	if tag == 'people Y +' then
	doTweenY('people Y -', 'people', 900, 0.1)		
	end	
end
function onBeatHit()
	if curBeat == 160 then	
	doTweenAlpha('blackScreenAlpha 1', 'blackScreen', 1, 0.01);
	end		
	if curBeat % 2 == 0 then
	triggerEvent('Add Camera Zoom', 0.01, 0.1)
	end
	if curBeat % 1 == 0 then
	triggerEvent('Add Camera Zoom', 0.01, 0.05)
	end	
	if curBeat % 0 == 0 then
	triggerEvent('Add Camera Zoom', 0.01, 0.025)
	end	
end		
