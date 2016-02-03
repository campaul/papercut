require 'array'
require 'object'

Entity = Object:extend()

function Entity:constructor(position, box)
    self.position = position
    self.box = box
    self.children = Array:new()

    self.debug_color = {255, 255, 255, 255}
end

function Entity:attach(e)
    self.children:insert(e)
    e.parent = self
end

function Entity:debug(g)
    g.push()
    g.setColor(self.debug_color)
    g.rectangle("line", self.position.x, self.position.y, self.box.width, self.box.height)
    g.pop()
end
