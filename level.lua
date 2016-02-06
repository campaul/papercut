require 'array'
require 'camera'
require 'entity'
require 'floor'
require 'geometry'
require 'object'
require 'player'

debug = true

Level = Object:extend()

function Level:constructor()
    -- create camera
    self.camera = Camera:new(Point:new(0, 0))

    -- create world
    self.world = Entity:new(Point:new(0, 0), Box:new(0, 0))

    -- create player
    self.player = Player:new(Point:new(100, 100), Box:new(50, 50))

    -- create some floors
    local world_floor = WorldFloor:new(550)
    local platform1 = Floor:new(Point:new(100, 100), 300)
    local platform2 = Floor:new(Point:new(400, 250), 300)
    local platform3 = Floor:new(Point:new(100, 400), 300)

    -- add things to the world
    self.world:attach(world_floor)
    self.world:attach(platform1)
    self.world:attach(platform2)
    self.world:attach(platform3)
    self.world:attach(self.player)

    -- add things for the physics system
    self.floors = Array:new()
    self.floors:insert(world_floor)
    self.floors:insert(platform1)
    self.floors:insert(platform2)
    self.floors:insert(platform3)
end

function Level:update(dt)
    self.player:update(dt, self.floors)
end

function Level:draw(g)
    local scroll = -self.player.position.x + (g.getWidth() / 2) - (self.player.box.width / 2)
    g.translate(scroll, 0)
    self.camera:draw(self.world, love.graphics)
    if debug then
        self.camera:debug(self.world, love.graphics)
    end
end

function Level:keypressed(key)
    if key == 'space' then
        self.player.jumping = self.player.on_floor
    end

    if key == 'a' then
        self.player.left = true
        self.player.right = false
    end

    if key == 'd' then
        self.player.right = true
        self.player.left = false
    end
end

function Level:keyreleased(key)
    if key == 'space' then
        self.player.jumping = false
    end

    if key == 'a' then
        self.player.left = false
    end

    if key == 'd' then
        self.player.right = false
    end
end
