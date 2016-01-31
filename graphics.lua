require 'entity'
require 'geometry'

Drawable = Entity:extend()

function Drawable:draw()
end

Rectangle = Drawable:extend()

function Rectangle:constructor(position, box)
    Drawable.constructor(self, position)
    self.box = box
end

function Rectangle:draw()
    love.graphics.rectangle("fill", self.position.x, self.position.y, self.box.width, self.box.height)
end

Debug = Drawable:extend()

function Debug:constructor()
    Drawable.constructor(self, Point:new(0, 0))
end

function Debug:draw()
    local box = self.parent.box or Box:new(50, 50)
    love.graphics.rectangle("line", self.parent.position.x, self.parent.position.y, box.width, box.height)
end
