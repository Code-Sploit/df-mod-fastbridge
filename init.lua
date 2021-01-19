local etime = 0
minetest.register_globalstep(function(dtime)
    etime = etime + dtime
    if etime < 1 then return end
    local player = minetest.localplayer
    if not player then return end
    local pos = player:get_pos()
    if minetest.settings:get_bool("fast_bridge") then
        local posxdecimal = pos.x % 1
        local poszdecimal = pos.z % 1

        posxdecimal = math.abs(posxdecimal)
        poszdecimal = math.abs(poszdecimal)
        
        if posxdecimal > 0.7 and posxdecimal < 0.9 or poszdecimal > 0.7 and poszdecimal < 0.9 or posxdecimal > 0.5 and posxdecimal < 0.3 or posxdecimal < 0.3 and posxdecimal > 0.1 or poszdecimal > 0.5 and poszdecimal < 0.3 or poszdecimal < 0.3 and poszdecimal > 0.1 then
            minetest.set_keypress("sneak", true)
        else
            minetest.set_keypress("sneak", false)
        end
    end
end)

    
minetest.register_cheat("FastBridge", "Movement", "fast_bridge")
