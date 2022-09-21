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
	triggerEvent('Add Camera Zoom', 0.1, 0.05)
	end	
	if curBeat == 64 then
	doTweenAngle('moveCamGameQ', 'camGame', -5, 2)
	doTweenAngle('moveCamHUDQ', 'camHUD', -5, 2)
	end
	if curBeat == 128 then
	doTweenAngle('camGDefault', 'camGame', 0, 0.001)
	doTweenAngle('camHUDDefault', 'camHUD', 0, 0.001)
	cancelTween('moveCamHUDQ')
	cancelTween('moveCamHUDQ1')
	cancelTween('moveCamGameQ')
	cancelTween('moveCamGameQ1')
	end
	if curBeat == 192 then
	doTweenAngle('moveCamGameQ2', 'camGame', -5, 2)
	doTweenAngle('moveCamHUDQ2', 'camHUD', -5, 2)
	end
	if curBeat == 252 then
	doTweenAngle('camGDefault2', 'camGame', 0, 0.001)
	doTweenAngle('camHUDDefault2', 'camHUD', 0, 0.001)
	cancelTween('moveCamHUDQ2')
	cancelTween('moveCamHUDQ12')
	cancelTween('moveCamGameQ2')
	cancelTween('moveCamGameQ12')
	end
	if curBeat == 96 then
	triggerEvent('Screen Shake', '0.3, 0.5', '0.3, 0.5');
	triggerEvent('Add Camera Zoom', '0.2', '0.4');
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
    if tag == 'moveCamGameQ2' then
    doTweenAngle('moveCamGameQ12', 'camGame', 5, 2)   
    end
    if  tag == 'moveCamGameQ12' then
    doTweenAngle('moveCamGameQ2', 'camGame', -5, 2)   
    end
    if tag == 'moveCamHUDQ2' then
    doTweenAngle('moveCamHUDQ12', 'camHUD', 5, 2)   
    end
    if  tag == 'moveCamHUDQ12' then
    doTweenAngle('moveCamHUDQ2', 'camHUD', -5, 2)   
    end
end
function onCreate()
	makeLuaSprite('bfdark', 'bfvignette', -500, -150);
	setObjectCamera('bfdark', 'other');	
	doTweenAlpha('bfdark-', 'bfdark', 0, 0.001);
	addLuaSprite('bfdark', true);		
	
	makeLuaSprite('cubedark', 'cubevignette', -300, -150);
	setObjectCamera('cubedark', 'other');
	addLuaSprite('cubedark', true);
	
	makeLuaSprite('border', 'border', 0, -80);
	setObjectCamera('border', 'hud');
	scaleObject('border', 0.8, 0.8);
	addLuaSprite('border', false);
	
	makeLuaSprite('two', 'ready', 426, 243);
	setObjectCamera('two', 'hud');
	scaleObject('two', 0.65, 0.65);
	doTweenAlpha('two-', 'two', 0, 0.001);
	addLuaSprite('two', false);
	
	makeLuaSprite('one', 'set', 451, 255);
	setObjectCamera('one', 'hud');
	scaleObject('one', 0.65, 0.65);
	doTweenAlpha('one-', 'one', 0, 0.001);		
	addLuaSprite('one', false);
	
	makeLuaSprite('go', 'go', 494, 220);
	setObjectCamera('go', 'hud');
	scaleObject('go', 0.65, 0.65);
	doTweenAlpha('go-', 'go', 0, 0.001);
	addLuaSprite('go', false);	
	
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
function onCreatePost()
	setProperty('newGUI.alpha', 0);
	setProperty('iconP1.alpha', 0);
	setProperty('iconP2.alpha', 0);
	setProperty('healthBar.alpha', 0);
end
function onStepHit()
	if curStep == 333 then
	noteTweenAlpha("x7-", 7, 0.05, 0.3);
	noteTweenAlpha("x4-", 4, 0.05, 0.3);
	end
	if curStep == 348 then
	noteTweenAlpha("x7+", 7, 1, 0.5);
	noteTweenAlpha("x4+", 4, 1, 0.5);
	end
	if curStep == 461 then
	noteTweenAlpha("x7-", 7, 0.05, 0.3);
	noteTweenAlpha("x4-", 4, 0.05, 0.3);
	end
	if curStep == 476 then
	noteTweenAlpha("x7+", 7, 1, 0.5);
	noteTweenAlpha("x4+", 4, 1, 0.5);
	end	
	if curStep == 845 then
	noteTweenAlpha("x7-", 7, 0.05, 0.3);
	noteTweenAlpha("x4-", 4, 0.05, 0.3);
	end
	if curStep == 860 then
	noteTweenAlpha("x7+", 7, 1, 0.5);
	noteTweenAlpha("x4+", 4, 1, 0.5);
	end	
	if curStep == 965 then
	noteTweenAlpha("x7-", 7, 0.05, 0.3);
	noteTweenAlpha("x4-", 4, 0.05, 0.3);
	end
	if curStep == 972 then
	noteTweenAlpha("x7+", 7, 1, 0.5);
	noteTweenAlpha("x4+", 4, 1, 0.5);
	end				
	if curStep == 32 then
	doTweenAlpha('cubedark-', 'cubedark', 0, 0.5);
	doTweenAlpha('bfdark+', 'bfdark', 1, 0.2);
	end
	if curStep == 64 then
	doTweenAlpha('cubedark+', 'cubedark', 1, 0.2);
	doTweenAlpha('bfdark-', 'bfdark', 0, 0.5);
	end
	if curStep == 96 then
	doTweenAlpha('cubedark-', 'cubedark', 0, 0.5);
	doTweenAlpha('bfdark+', 'bfdark', 1, 0.2);
	end
	if curStep == 128 then
	doTweenAlpha('bfdark-', 'bfdark', 0, 1.5);
	doTweenY('borderBye', 'border.scale', 2, 5)
	setProperty('newGUI.alpha', 1);
	setProperty('iconP1.alpha', 1);
	setProperty('iconP2.alpha', 1);
	setProperty('healthBar.alpha', 1);
	end
	if curStep == 512 then
	noteTweenAlpha("n1-", 0, 0, 12);
	noteTweenAlpha("n2-", 1, 0, 12);
	noteTweenAlpha("n3-", 2, 0, 12);
	noteTweenAlpha("n4-", 3, 0, 12);
	noteTweenAlpha("n5-", 4, 0, 12);
	noteTweenAlpha("n6-", 5, 0, 12);
	noteTweenAlpha("n7-", 6, 0, 12);
	noteTweenAlpha("n8-", 7, 0, 12);
	doTweenAlpha('healthBarBye', 'healthBar', 0, 12);
	doTweenAlpha('iconP1bye', 'iconP1', 0, 12);
	doTweenAlpha('iconP2bye', 'iconP2', 0, 12);
	end	
	if curStep == 997 then --997
	doTweenY('borderHi', 'border.scale', 0.8, 1)
	doTweenAlpha('bfdark+', 'bfdark', 1, 1);
	setProperty('newGUI.alpha', 0);
	setProperty('iconP1.alpha', 0);
	setProperty('iconP2.alpha', 0);
	setProperty('healthBar.alpha', 0);
	end
	if curStep == 1008 then
	noteTweenAlpha("note1", 0, 0, 1);
	noteTweenAlpha("note2", 1, 0, 1);
	noteTweenAlpha("note3", 2, 0, 1);
	noteTweenAlpha("note4", 3, 0, 1);
	end
	if curStep == 752 then --Three
	noteTweenAlpha("n1+", 0, 1, 1.2);
	noteTweenAlpha("n2+", 1, 1, 1.2);
	noteTweenAlpha("n3+", 2, 1, 1.2);
	noteTweenAlpha("n4+", 3, 1, 1.2);
	noteTweenAlpha("n5+", 4, 1, 1.2);
	noteTweenAlpha("n6+", 5, 1, 1.2);
	noteTweenAlpha("n7+", 6, 1, 1.2);
	noteTweenAlpha("n8+", 7, 1, 1.2);
	doTweenAlpha('healthBarBye', 'healthBar', 1, 1.2);
	doTweenAlpha('iconP1bye', 'iconP1', 1, 1.2);
	doTweenAlpha('iconP2bye', 'iconP2', 1, 1.2);
	playSound('intro3')
	playSound('scratch_sfx')
	triggerEvent('Set Cam Zoom', '0.9', '')
	end
	if curStep == 756 then --Two
	playSound('intro2')
	playSound('scratch_sfx')
	triggerEvent('Set Cam Zoom', '1.1', '')
	doTweenAlpha('two+', 'two', 1, 0.0001);
	doTweenAlpha('two-', 'two', 0, 0.5);
	end
	if curStep == 760 then --One
	playSound('intro1')
	playSound('scratch_sfx')
	triggerEvent('Set Cam Zoom', '0.9', '')
	doTweenAlpha('one+', 'one', 1, 0.0001);
	doTweenAlpha('one-', 'one', 0, 0.5);	
	end
	if curStep == 764 then --Go
	playSound('introGo')
	playSound('scratch_sfx')
	triggerEvent('Set Cam Zoom', '0.7', '')
	doTweenAlpha('go+', 'go', 1, 0.0001);
	doTweenAlpha('go-', 'go', 0, 0.5);	
	end
	if curStep == 1024 then
	doTweenAlpha('line1+', 'line1', 1, 0.2);	
	end	
	if curStep == 1028 then
	doTweenAlpha('line2+', 'line2', 1, 0.2);
	end	
	if curStep == 1032 then
	doTweenAlpha('line3+', 'line3', 1, 0.2);	
	end	
	if curStep == 1036 then
	doTweenAlpha('line4+', 'line4', 1, 0.2);
	end				
end
