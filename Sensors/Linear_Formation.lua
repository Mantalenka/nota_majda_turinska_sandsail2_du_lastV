local sensorInfo = {
	name = "Linear_Formation",
	desc = "Flip keys and values of units table",
	author = "PepeAmpere_a_MajdaT_openAI",
	date = "2025-04-22",
	license = "MIT",
}

local EVAL_PERIOD_DEFAULT = -1 -- instatnt, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end


-- Linear_Formation: senzor pro lineární formaci
return function(listOfUnits)
	local groupDefinition = {}
	local linearFormation = {}

	local spacing = 20  -- mezera mezi jednotkami
	for i = 1, #listOfUnits do
		local unitID = listOfUnits[i]
		groupDefinition[unitID] = i
		linearFormation[i] = Vec3((i - 1) * spacing, 0, 0)  -- rovná linie podél osy X
	end

	return {
		group = groupDefinition,
		formation = linearFormation
	}
end
