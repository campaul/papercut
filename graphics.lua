require 'entity'

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
