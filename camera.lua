require 'graphics'

Camera = Object:extend()

function Camera:draw(node)
    if node.draw then
        node:draw()
    end

    for child in node.children:each() do
        Camera:draw(child)
    end
end
