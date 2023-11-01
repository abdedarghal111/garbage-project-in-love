local kernel = require("kernel")

local Cube = require("Cube")

local player = {
    body = Cube.new(),
    playerSpeed = 200,
    puntos = 0
}

function player:update(dt)
    if love.keyboard.isDown("a") then
        local x,y = self.body:getPosition()
        self.body:setPosition(x-dt*self.playerSpeed,nil)
    end
    if love.keyboard.isDown("w") then 
        local x,y = self.body:getPosition()
        self.body:setPosition(nil,y-dt*self.playerSpeed)
    end
    if love.keyboard.isDown("d") then 
        local x,y = self.body:getPosition()
        self.body:setPosition(x+dt*self.playerSpeed,nil)
    end
    if love.keyboard.isDown("s") then 
        local x,y = self.body:getPosition()
        self.body:setPosition(nil,y+dt*self.playerSpeed)
    end
end

function player:draw()
    love.graphics.print("puntos: "..self.puntos)
end

function player:getDimensions()
    return self.body:getDimensions()
end

kernel:addUpdate(player)
kernel:addDraw(player)

return player