require 'entity'
require 'geometry'

Floor = Entity:extend()

function Floor:constructor(position, width)
    Entity.constructor(self, position, Box:new(width, 1))
end

function Floor:below(e)
    if e.position.y + e.box.height > self.position.y then
        return false
    end

    if e.position.x + e.box.width < self.position.x then
       return false
    end

    if e.position.x > self.position.x + self.box.width then
        return false
    end

    return true
end

function Floor:above(e)
    if e.position.y + e.box.height < self.position.y then
        return false
    end

    if e.position.x + e.box.width < self.position.x then
       return false
    end

    if e.position.x > self.position.x + self.box.width then
        return false
    end

    return true
end

WorldFloor = Entity:extend()

function WorldFloor:constructor(y)
    Entity.constructor(self, Point:new(0, y), Box:new(love.graphics.getWidth(), 1))
end

function WorldFloor:below(e)
    if e.position.y + e.box.height > self.position.y then
        return false
    end

    return true
end

function WorldFloor:above(e)
    if e.position.y + e.box.height < self.position.y then
        return false
    end

    return true
end
