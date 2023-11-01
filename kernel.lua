local kernel = {
    drawObjects = {},
    updateObjects = {}
}

function kernel:addDraw(obj)
    table.insert(self.drawObjects,obj)
end

function kernel:addUpdate(obj)
    table.insert(self.updateObjects,obj)
end

function kernel:draw()
    for i,v in pairs(self.drawObjects) do
        v:draw()
    end
end

function kernel:update(dt)
    for i,v in pairs(self.updateObjects) do
        v:update(dt)
    end
end


return kernel