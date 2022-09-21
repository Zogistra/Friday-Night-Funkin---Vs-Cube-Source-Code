function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Lightning Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'lightningNOTE'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
		end
	end
end

local healthDrain = 0;
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Lightning Note' then
	characterPlayAnim('boyfriend', 'hurt', true);
	healthDrain = healthDrain + 0.6;
	playSound('lightning_sfx', 1, 'lightning');
	doTweenAlpha('lightning1Alpha+', 'lightning1', 1, 0.001);
	doTweenAlpha('lightning1Alpha-', 'lightning1', 0, 0.5);
	doTweenAlpha('lightningAlpha+', 'lightning', 1, 0.001);
	doTweenAlpha('lightningAlpha-', 'lightning', 0, 0.5);	
	doTweenAlpha('lightAlpha+', 'light', 1, 0.001);
	end
end

function onUpdate(elapsed)
	if healthDrain > 0 then
		healthDrain = healthDrain - 0.1 * elapsed;
		setProperty('health', getProperty('health') - 1 * elapsed);
		if healthDrain < 0 then
			healthDrain = 0;
		end
	end
end
