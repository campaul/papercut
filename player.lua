require 'entity'
require 'geometry'

GRAVITY = 0.098
JUMP_IMPULSE = 3
JUMP_DURATION = 70
RUN_ACCELERATION = 0.1
RUN_SPEED = 3
TICK_SIZE = 0.005

Player = Entity:extend()

function Player:constructor(position, box)
    Entity.constructor(self, position)
    self.box = box
    self.velocity = Vector:new(0, 0)
    self.jumping = false
    self.left = false
    self.right = false
    self.jump_fuel = JUMP_DURATION
    self.on_floor = false
end

function Player:update(dt, floors)
    local ticks = math.floor(dt / TICK_SIZE)

    landings = Array:new()
    for floor in floors:each() do
        if floor:below(self) then
            landings:insert(floor)
        end
    end

    for i = 1, ticks do
        if self.jumping and self.jump_fuel == JUMP_DURATION then
            self.velocity.y = self.velocity.y - JUMP_IMPULSE
        end

        if self.jumping and self.jump_fuel > 0 then
            self.velocity.y = self.velocity.y - (math.sqrt(self.jump_fuel / JUMP_DURATION) * GRAVITY)
            self.jump_fuel = self.jump_fuel - 1
        end

        if self.left then
            -- accelerate left
            if self.velocity.x > -RUN_SPEED then
                self.velocity.x = math.max(self.velocity.x - RUN_ACCELERATION, -RUN_SPEED)
            end
        elseif self.right then
            -- accelerate right
            if self.velocity.x < RUN_SPEED then
                self.velocity.x = math.min(self.velocity.x + RUN_ACCELERATION, RUN_SPEED)
            end
        else
            -- decelerate
            if self.velocity.x > 0 then
                self.velocity.x = math.max(self.velocity.x - RUN_ACCELERATION, 0)
            elseif self.velocity.x < 0 then
                self.velocity.x = math.min(self.velocity.x + RUN_ACCELERATION, 0)
            end
        end

        self.velocity.y = self.velocity.y + GRAVITY

        self.position.y = self.position.y + self.velocity.y
        self.position.x = self.position.x + self.velocity.x
    end

    self.on_floor = false
    for floor in landings:each() do
        if floor:above(self) then
            self.position.y = floor.position.y - self.box.height
            self.velocity.y = 0
            self.jump_fuel = JUMP_DURATION
            self.on_floor = true
        end
    end
end
