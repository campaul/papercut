require 'level'

Level_01 = Level:extend()

function Level_01:constructor()
    Level.constructor(self)
    self:add_surface(WorldFloor:new(550))
    self:add_surface(Floor:new(Point:new(100, 100), 300))
    self:add_surface(Floor:new(Point:new(400, 250), 300))
    self:add_surface(Floor:new(Point:new(100, 400), 300))
end
