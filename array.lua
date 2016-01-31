require 'object'
require 'table'

Array = Object:extend()

function Array:each()
    local i = 0
    local length = table.getn(self)
    return function()
        i = i + 1
        if i <= length then
            return self[i]
        end
    end
end

function Array:insert(e)
    table.insert(self, e)
end
