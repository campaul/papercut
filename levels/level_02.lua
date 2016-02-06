require 'level'

Level_02 = Level:extend()

function Level_02:constructor()
    Level.constructor(self)
    
    self:add_surface(WorldFloor:new(550))
    self:add_surface(Floor:new(Point:new(400, 100), 300))
    self:add_surface(Floor:new(Point:new(100, 250), 300))
    self:add_surface(Floor:new(Point:new(400, 400), 300))
end
