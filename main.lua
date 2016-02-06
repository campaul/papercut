require 'levels/level_01'

function love.load()
    love.window.setTitle('Papercut')
    level = Level_01:new()
end

function love.update(dt)
    level:update(dt)
end

function love.draw()
    level:draw(love.graphics)
end

function love.keypressed(key)
    level:keypressed(key)
end

function love.keyreleased(key)
    level:keyreleased(key)
end
