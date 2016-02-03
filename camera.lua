require 'object'

Camera = Object:extend()

function Camera:draw(node, g)
    if node.draw then
        node:draw(g)
    end

    -- TODO: make this an iterator and share with debug
    for child in node.children:each() do
        Camera:draw(child, g)
    end
end

function Camera:debug(node, g)
    node:debug(g)

    -- TODO: make this an iterator and share with draw
    for child in node.children:each() do
        Camera:debug(child, g)
    end
end
