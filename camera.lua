require 'graphics'

Camera = Drawable:extend()

function Camera:draw(node)
    love.graphics.push()
    love.graphics.translate(node.position.x, node.position.y)

    if not node then
        -- `node` is the camera object. Set it, but don't draw.
        node = self
    elseif node.draw then
        node:draw()
    end

    for child in node.children:each() do
        Camera:draw(child)
    end

    love.graphics.pop()
end
