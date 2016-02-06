require 'level'

level_01 = Level:new()

level_01:add_surface(WorldFloor:new(550))
level_01:add_surface(Floor:new(Point:new(100, 100), 300))
level_01:add_surface(Floor:new(Point:new(400, 250), 300))
level_01:add_surface(Floor:new(Point:new(100, 400), 300))
