require 'array'
require 'camera'
require 'entity'
require 'geometry'
require 'graphics'
require 'level'
require 'player'

world = Entity:new(Point:new(0, 0))
camera = Camera:new(Point:new(0, 0))
floors = Array:new()

function love.load()
    love.window.setTitle('Papercut')

    -- create player
    player = Player:new(Point:new(100, 100), Box:new(50, 50))
    player:attach(Debug:new())

    -- create some floors
    world_floor = WorldFloor:new(550)
    world_floor:attach(Debug:new())
    platform1 = Floor:new(Point:new(100, 100), 300)
    platform1:attach(Debug:new())
    platform2 = Floor:new(Point:new(400, 250), 300)
    platform2:attach(Debug:new())
    platform3 = Floor:new(Point:new(100, 400), 300)
    platform3:attach(Debug:new())

    -- add things to the world
    world:attach(world_floor)
    world:attach(platform1)
    world:attach(platform2)
    world:attach(platform3)
    world:attach(player)

    -- add things for the physics system
    floors:insert(world_floor)
    floors:insert(platform1)
    floors:insert(platform2)
    floors:insert(platform3)
end

function love.update(dt)
    player:update(dt, floors)
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
