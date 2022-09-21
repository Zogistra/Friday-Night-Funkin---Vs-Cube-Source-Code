local y = 0
local t = 0
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 850; --dad x
local yy = 900; --dad y
local xx2 = 1800; --bf x
local yy2 = 980; --bf y
local ofs = 75;
local followchars = true;
local del = 0;
local del2 = 0;
local drain = 0.01 -- the funne
function onUpdate()
	if followchars == true then
        if mustHitSection == false then
            --setProperty('defaultCamZoom', 0.6)
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
            --setProperty('defaultCamZoom', 0.7)
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
function onBeatHit()
	if curBeat % 2 == 0 then
	triggerEvent('Add Camera Zoom', 0.01, 0.1)	
	end
	if curBeat % 1 == 0 then
	triggerEvent('Add Camera Zoom', 0.05, 0.01)	
	end		
end
function onCreate()
	makeLuaSprite('bfdark', 'bfvignette', -500, -150);
	setObjectCamera('bfdark', 'other');	
	doTweenAlpha('bfdark-', 'bfdark', 0, 0.001);
	addLuaSprite('bfdark', true);		
	
	makeLuaSprite('cubedark', 'cubevignette', -300, -150);
	setObjectCamera('cubedark', 'other');
	doTweenAlpha('cubedark-', 'cubedark', 0, 0.001);
	addLuaSprite('cubedark', true);
	
	makeLuaSprite('border', 'border', 0, -80);
	setObjectCamera('border', 'hud');
	scaleObject('border', 0.8, 0.8);
	doTweenY('borderBye', 'border.scale', 2, 0.001)
	addLuaSprite('border', false);
	
		makeLuaSprite('line1', 'line', 0, 0);
		setObjectCamera('line1', 'hud');
		scaleObject('line1', 1.15, 1.15);
		doTweenAlpha('line1Alpha', 'line1', 0, 0.001);
		addLuaSprite('line1', true);	
	makeLuaSprite('line2', 'line', 480, 0);
	setObjectCamera('line2', 'hud');
	scaleObject('line2', 1.15, 1.15);
	doTweenAlpha('line2Alpha', 'line2', 0, 0.001);
	addLuaSprite('line2', true);	
		makeLuaSprite('line3', 'line', 960, 0);
		setObjectCamera('line3', 'hud');
		scaleObject('line3', 1.15, 1.15);
		doTweenAlpha('line3Alpha', 'line3', 0, 0.001);
		addLuaSprite('line3', true);	
	makeLuaSprite('line4', 'line', 1440, 0);
	setObjectCamera('line4', 'hud');
	scaleObject('line4', 1.15, 1.15);
	doTweenAlpha('line4Alpha', 'line4', 0, 0.001);
	addLuaSprite('line4', true);	
end
function onStepHit()
	if curStep == 512 then
	doTweenAlpha('cubedark-', 'cubedark', 1, 0.2);
	doTweenAlpha('bfdark+', 'bfdark', 0, 0.2);
	end
	if curStep == 576 then
	doTweenAlpha('cubedark-', 'cubedark', 0, 0.5);
	doTweenAlpha('bfdark+', 'bfdark', 1, 0.2);
	end
	if curStep == 1280 then
	doTweenAlpha('cubedark-', 'cubedark', 1, 0.2);
	doTweenAlpha('bfdark+', 'bfdark', 0, 0.2);
	end
	if curStep == 1344 then
	doTweenAlpha('cubedark-', 'cubedark', 0, 0.5);
	doTweenAlpha('bfdark+', 'bfdark', 1, 0.2);
	end			
	if curStep == 511 then
	doTweenY('borderHi', 'border.scale', 0.8, 0.1)
	end
	if curStep == 640 then
	doTweenY('borderHi', 'border.scale', 2, 5)
	doTweenAlpha('bfdark-', 'bfdark', 0, 1.5);
	end
	if curStep == 1279 then
	doTweenY('borderHi', 'border.scale', 0.8, 0.1)
	end
	if curStep == 1408 then
	doTweenY('borderHi', 'border.scale', 2, 5)
	doTweenAlpha('bfdark-', 'bfdark', 0, 1.5);
	end	
	if curStep == 1919 then
	doTweenAlpha('line1+', 'line1', 1, 0.2);
	doTweenAlpha('bfdark+', 'bfdark', 1, 0.2);
	end	
	if curStep == 1928 then
	doTweenAlpha('line2+', 'line2', 1, 0.2);
	end	
	if curStep == 1936 then
	doTweenAlpha('line3+', 'line3', 1, 0.2);
	end	
	if curStep == 1944 then
	doTweenAlpha('line4+', 'line4', 1, 0.2);
	end						
end
