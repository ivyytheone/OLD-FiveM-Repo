
RegisterNetEvent('eyrp_intro:Cutscene')  
AddEventHandler('eyrp_intro:Cutscene', function() 
    local plyrId = PlayerPedId() -- ID DU JOUEURS
    local playerClone = ClonePed_2(plyrId, 0.0, false, true, 1) ----
    -----------------------------------------------
    RequestCutscene("MP_INTRO_CONCAT", 8) 
    while not HasCutsceneLoaded() do Wait(10) end 
    DoScreenFadeIn(250) 
    SetCutsceneEntityStreamingFlags('MP_Male_Character', 0, 1) 
    local female = RegisterEntityForCutscene(0,"MP_Female_Character",3,0,64) 
    RegisterEntityForCutscene(PlayerPedId(), 'MP_Male_Character', 0, GetEntityModel(PlayerPedId()), 64)
    GetEntityIndexOfCutsceneEntity('MP_Female_Character', GetHashKey(GetEntityModel('MP_Female_Character')))
    NetworkSetEntityInvisibleToNetwork(female, true)
    -----------------------------------------------
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_1", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
--SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_2", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_3", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_4", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_5", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_6", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_7", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_1', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_2', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_3', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_4', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_5', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_6', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_7', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    ---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_1', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
   -- RegisterEntityForCutscene(0, 'MP_Plane_Passenger_2', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_3', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_4', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_5', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_6', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_7', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    NewLoadSceneStartSphere(-1212.79, -1673.52, 7, 1000, 0)

    SetWeatherTypeNow("EXTRASUNNY") 
    StartCutscene(4) 

    DeletePedClone = function()
        DeletePed(playerClone)
    end
end)