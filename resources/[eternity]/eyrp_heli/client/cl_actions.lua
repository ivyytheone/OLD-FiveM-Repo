Action = {};

Action.HandleSpotlight = function()
	spotlight_state = not spotlight_state
	TriggerServerEvent("eyrp_heli:UpdateLights", spotlight_state)
	PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
end