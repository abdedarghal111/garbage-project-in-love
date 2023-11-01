local kernel = require("kernel")
local Cube = require("Cube")
local player = require("player")

local moneda = Cube.new()

moneda:setSize(20,20)
do
    local x,y = love.graphics.getDimensions()
    moneda:setPosition(x/2,y/2)
end

function moneda:update()
    if self:iscollidingWith(player) then
        self:setRandomPos()
        self:rewardPlayer()
    end
end

function moneda:rewardPlayer()
    player.puntos = player.puntos + 1
end

function moneda:setRandomPos()
    local x,y = love.graphics.getDimensions()
    local r1,r2 = math.random(0,100)/100,math.random(0,100)/100
    x,y =  (x-self.xs)*r1,(y-self.ys)*r2
    moneda:setPosition(x,y)
end


function moneda:iscollidingWith(player)
    local x,y,a,b = player:getDimensions()
    local X,Y,A,B = self:getDimensions()
    a,b,A,B = x+a,y+b,X+A,Y+B
    
    if x > A then return false
    elseif a < X then return false
    elseif y > B then return false
    elseif b < Y then return false
    else
        return true
    end
end

function moneda:draw()
    love.graphics.setColor(1,0,1)
    love.graphics.rectangle("fill",self.xp,self.yp,self.xs,self.ys)
    love.graphics.setColor(1,1,1)
end


kernel:addUpdate(moneda)
return moneda