local kernel = require("kernel")
local player = require("player")
local moneda = require("moneda")
function love.load()

end

function love.update(dt)
    kernel:update(dt)
end

function love.draw()
    kernel:draw()
end
