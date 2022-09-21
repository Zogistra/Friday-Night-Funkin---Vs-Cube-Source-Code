function onEvent(n, v1, v2)
	if n == "Warning" then
		--Appear
		triggerEvent('Add Camera Zoom', '0.01', '0.2')
		triggerEvent('Screen Shake', '0.1, 0.3', '')
		objectPlayAnimation('warning', 'critical-error', false)
		doTweenAlpha('vignetteRedAlpha+', 'vignetteRed', 0.5, 0.01);	
		doTweenAlpha('RedAlpha+', 'Red', 0.25, 0.01);		
	
		--Disappear	
		doTweenAlpha('vignetteRedAlpha-', 'vignetteRed', 0, 1);
		doTweenAlpha('RedAlpha-', 'Red', 0, 1);							
	end
end
