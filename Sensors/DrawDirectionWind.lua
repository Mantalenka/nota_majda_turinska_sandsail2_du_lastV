local sensorInfo = {
	name = "DrawDirectionWind",
	desc = "Sends wind data to drawing widget",
	author = "PepeAmpere_+_MajdaT",
	date = "2018-04-16",
	license = "MIT",
}

-- get madatory module operators
VFS.Include("modules.lua") -- modules table
VFS.Include(modules.attach.data.path .. modules.attach.data.head) -- attach lib module

-- get other madatory dependencies
attach.Module(modules, "message") -- communication backend load

local EVAL_PERIOD_DEFAULT = -1 -- acutal, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end

-- @description return current wind statistics
return function()
	if #units > 0 then
		local unitID = units[1]
		local x,y,z = Spring.GetUnitPosition(unitID)
		local windX, windY, windZ = Spring.GetWind()
		local startPos = Vec3(x, y, z)
		local endPos = startPos + Vec3(windX, windY, windZ) * 10
		
		if (Script.LuaUI('exampleDebug_update')) then
			Script.LuaUI.exampleDebug_update(
				unitID, -- key
				{	-- data
					startPos = startPos,
					endPos = endPos
				}
			)
		end
		return {	-- data
					startPos = startPos,
					endPos = endPos
				}
	end
end