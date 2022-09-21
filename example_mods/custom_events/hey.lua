--Script Made By TailsTeZ
function onEvent(name, value1, value2)
	if name == "hey" then
		friends = tonumber(value1); --BF = BF | GF = GF
		opponent = tonumber(value2);
		
		if friends == BF then --BF
		characterPlayAnim('boyfriend', 'hey', true);
		triggerEvent('Add Camera Zoom', 0.01, 0.2)
		end
		if friends == GF then --GF
		characterPlayAnim('gf', 'cheer', true);
		triggerEvent('Add Camera Zoom', 0.01, 0.2)	
		end
		if opponent == DAD then --OPPONENT
		characterPlayAnim('dad', 'hey', true);
		triggerEvent('Add Camera Zoom', 0.01, 0.2)	
		end	
	end	
end
