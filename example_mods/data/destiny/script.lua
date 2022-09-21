local y = 0
local t = 0
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 1500; --dad x
local yy = 1200; --dad y
local xx2 = 2500; --bf x
local yy2 = 1200; --bf y
local ofs = 75;
local followchars = true;
local del = 0;
local del2 = 0;
local drain = 0.01 -- the funne
function onBeatHit()
	if curBeat % 1 == 0 then
	triggerEvent('Add Camera Zoom', '0.01', '0.025')
	end
	if curBeat % 8 == 0 then
	triggerEvent('Screen Shake', '0.1, 0.3', '')
	end	
end
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
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
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
local defaultNotePos = {};

local shake = 3;

 
function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
 
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
 
        table.insert(defaultNotePos, {x,y})
    end
end

function onUpdate(elapsed)
 
    songPos = getPropertyFromClass('Conductor', 'songPosition');
 
    currentBeat = (songPos / 9999) * (bpm / 9999)

    if curStep >= 0 and curStep < 9999 then
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
        end                                                        
end                                                           
    if curStep == 9999 then
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
        end
    end
end
function opponentNoteHit()
	triggerEvent('Screen Shake', '0.2, 0.01', '0.2, 0.01')
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
end
function onCreatePost()
    setProperty('newGUI.alpha', 0);
	setProperty('iconP1.alpha', 0);
	setProperty('iconP2.alpha', 0);
	setProperty('healthBar.alpha', 0);
	setProperty('HBB', 0)
end
function onBeatHit()
    if curBeat % 1 == 0 then
	triggerEvent('Add Camera Zoom', 0.05, 0.1)	
    end
    if curBeat == 416 then
    setProperty('door.alpha', 0)
    setProperty('door-i.alpha', 1)
    end
    if curBeat == 480 then
    setProperty('door.alpha', 1)
    setProperty('door-i.alpha', 0)
    end
    if curBeat == 8 then
    doTweenAlpha('cubedark-', 'cubedark', 0, 0.5);
	doTweenAlpha('bfdark+', 'bfdark', 1, 0.2);
    end
    if curBeat == 16 then
    doTweenAlpha('cubedark+', 'cubedark', 1, 0.2);
	doTweenAlpha('bfdark-', 'bfdark', 0, 0.5);
    end
    if curBeat == 24 then
    doTweenAlpha('cubedark-', 'cubedark', 0, 0.5);
	doTweenAlpha('bfdark+', 'bfdark', 1, 0.2);
    end
    if curBeat == 32 then
    doTweenAlpha('cubedark+', 'cubedark', 1, 0.2);
	doTweenAlpha('bfdark-', 'bfdark', 0, 0.5);
    end
    if curBeat == 40 then
    doTweenAlpha('cubedark-', 'cubedark', 0, 0.5);
	doTweenAlpha('bfdark+', 'bfdark', 1, 0.2);
    end
    if curBeat == 48 then
    doTweenAlpha('cubedark+', 'cubedark', 1, 0.2);
	doTweenAlpha('bfdark-', 'bfdark', 0, 0.5);
    end
    if curBeat == 56 then
    doTweenAlpha('cubedark-', 'cubedark', 0, 0.5);
	doTweenAlpha('bfdark+', 'bfdark', 1, 0.2);
    end
    if curBeat == 64 then
	doTweenAlpha('bfdark-', 'bfdark', 0, 1.5);
	doTweenY('borderBye', 'border.scale', 2, 3)
	setProperty('newGUI.alpha', 1);
	setProperty('iconP1.alpha', 1);
	setProperty('iconP2.alpha', 1);
	setProperty('healthBar.alpha', 1);
	setProperty('HBB', 1)
    end
    if curBeat == 352 then
    doTweenAlpha('cubedark+', 'cubedark', 1, 0.2);
    end
    if curBeat == 360 then
    doTweenAlpha('cubedark-', 'cubedark', 0, 0.5);
	doTweenAlpha('bfdark+', 'bfdark', 1, 0.2);
    end
    if curBeat == 368 then
    doTweenAlpha('cubedark+', 'cubedark', 1, 0.2);
	doTweenAlpha('bfdark-', 'bfdark', 0, 0.5);
    end
    if curBeat == 376 then
    doTweenAlpha('cubedark-', 'cubedark', 0, 0.5);
	doTweenAlpha('bfdark+', 'bfdark', 1, 0.2);
    end
    if curBeat == 384 then
	doTweenAlpha('bfdark-', 'bfdark', 0, 1.5);
	doTweenY('borderBye', 'border.scale', 2, 3)
	setProperty('newGUI.alpha', 1);
	setProperty('iconP1.alpha', 1);
	setProperty('iconP2.alpha', 1);
	setProperty('healthBar.alpha', 1);
	setProperty('HBB', 1)
    end
end