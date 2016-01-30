require 'object'

Point = Object:extend()

function Point:constructor(x, y)
    self.x = x
    self.y = y
end

Box = Object:extend()

function Box:constructor(width, height)
    self.width = width
    self.height = height
end
