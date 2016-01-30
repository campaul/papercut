Object = {}

function Object:extend()
    o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Object:new(...)
    o = {}
    setmetatable(o, self)
    self.__index = self

    o:constructor(unpack({...}))

    return o
end

function Object:constructor()
end
