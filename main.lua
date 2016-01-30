require 'entity'
require 'geometry'
require 'graphics'

local world = Entity:new(Point:new(0, 0))

function love.load()
    player = Entity:new(Point:new(100, 100))
    player_model = Rectangle:new(Point:new(0, 0), Box:new(50, 50))

    player:attach(player_model)
    world:attach(player)
end

function love.draw()
    draw(world) 
end

function draw(node)
    love.graphics.push()
    love.graphics.translate(node.position.x, node.position.y)

    if node.draw then
        node:draw()
    end

    for _, child in ipairs(node.children) do
        draw(child)
    end

    love.graphics.pop()
end