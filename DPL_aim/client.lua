local INPUT_AIM = 25
local UseFPS = false
local justpressed = 0

Citizen.CreateThread( function()

  while true do 
    
    Citizen.Wait(1)

    local playerId = PlayerId()

    if IsControlPressed(0, INPUT_AIM) then
      justpressed = justpressed + 1
    end

    if IsControlJustReleased(0, INPUT_AIM) then
    	if justpressed < 20 then
    		UseFPS = true
    	end
    	justpressed = 0
    end

    if UseFPS then
    	if GetFollowPedCamViewMode() == 0 then
    		SetFollowPedCamViewMode(4)
    		Citizen.Trace(GetFollowPedCamViewMode())
    	else
    		SetFollowPedCamViewMode(0)
    		Citizen.Trace(GetFollowPedCamViewMode())
    	end
		UseFPS = false
    end

  end

end)
