require 'camera'
require 'entity'
require 'geometry'
require 'graphics'

local world = Entity:new(Point:new(0, 0))
local camera = Camera:new(Point:new(0, 0))

function love.load()
    local player = Entity:new(Point:new(100, 100))
    local player_model = Rectangle:new(Point:new(0, 0), Box:new(50, 50))

    player:attach(player_model)
    world:attach(player)
    camera.attach(world)
end

function love.draw()
    camera:draw(world)
end
