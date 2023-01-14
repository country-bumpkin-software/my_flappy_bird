Martins = Class{}

function Martins:init(y)
    self.x = VIRTUAL_WIDTH + 32
    self.y = y
    self.martins = {
         ["face"] = Martin(self.y),
    }
    self.remove = false
end

function Martins:update(dt)
    if self.x > -MARTIN_WIDTH then
        self.x = self.x - MARTIN_SPEED * dt
        self.martins['face'].x = self.x
    else
        self.remove = true
    end
end

function Martins:render()
    for k, martin in pairs(self.martins) do
        martin:render()
    end
end