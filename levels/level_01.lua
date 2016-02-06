require 'level'
require 'levels/level_02'

Level_01 = Level:extend()

function Level_01:constructor()
    Level.constructor(self)
    
    local world_floor = WorldFloor:new(550)

    function world_floor:trigger()
        level = Level_02:new()
    end

    self:add_surface(world_floor)
    self:add_surface(Floor:new(Point:new(100, 100), 300))
    self:add_surface(Floor:new(Point:new(400, 250), 300))
    self:add_surface(Floor:new(Point:new(100, 400), 300))
end
