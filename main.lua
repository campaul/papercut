require 'camera'
require 'entity'
require 'geometry'
require 'graphics'
require 'player'

local world = Entity:new(Point:new(0, 0))
local camera = Camera:new(Point:new(0, 0))

function love.load()
    player = Player:new(Point:new(100, 500))
    local player_model = Rectangle:new(Point:new(0, 0), Box:new(50, 50))

    player:attach(player_model)
    world:attach(player)
    camera.attach(world)
end

function love.update(dt)
    player:update(dt)
end

function love.draw()
    camera:draw(world)
end

function love.keypressed(key)
    if key == 'space' then
        player.jumping = true
    end

    if key == 'a' then
        player.left = true
        player.right = false
    end

    if key == 'd' then
        player.right = true
        player.left = false
    end
end

function love.keyreleased(key)
    if key == 'space' then
        player.jumping = false
    end

    if key == 'a' then
        player.left = false
    end

    if key == 'd' then
        player.right = false
    end
end
