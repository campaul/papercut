require 'array'
require 'object'

Entity = Object:extend()

function Entity:constructor(position)
    self.position = position or Point:new(0, 0)
    self.children = Array:new()
end

function Entity:attach(e)
    self.children:insert(e)
    e.parent = self
end
