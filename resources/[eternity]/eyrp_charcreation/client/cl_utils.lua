Utils = {};

Cam = {}

Utils.CreateCam = function()  
    Cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true); 

    SetCamActive(Cam, true)
    RenderScriptCams(true, true, 2500, true, false)
    SetCamRot(Cam, 0.0, 0.0, 0.0)
    SetCamCoord(Cam, 402.8294, -998.8467, -98.80)
    Citizen.Wait(3000)
end


Utils.DestroyCam = function()
    SetCamActive(Cam, false)
    RenderScriptCams(false, false, 0, 1, 0);
    DestroyCam(Cam) 
end

Utils.loadAnimDict = function(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end


