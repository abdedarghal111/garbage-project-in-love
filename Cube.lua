local kernel = require("kernel")

local Cube = {}
Cube.__index = Cube

function Cube:draw()
    love.graphics.rectangle("fill",self.xp,self.yp,self.xs,self.ys)
end

function Cube:setSize(x,y)
    self.xs = x or self.xs
    self.ys = y or self.ys
end

function Cube:setPosition(x,y)
    self.xp = x or self.xp
    self.yp = y or self.yp
end

function Cube:getPosition()
    return self.xp,self.yp
end

function Cube:getDimensions()
    return self.xp,self.yp,self.xs,self.ys
end

function Cube:getSize()
    return self.xs,self.ys
end

function Cube.new(xp,yp,xs,ys)

    local self = {
        xp = xp or 0,
        yp = yp or 0,
        xs = xs or 100,
        ys = ys or 100
    }

    setmetatable(self,Cube)
    kernel:addDraw(self)
    return self
end

return Cube