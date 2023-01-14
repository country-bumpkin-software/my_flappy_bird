Martin = Class{}

local MARTIN_IMAGE = love.graphics.newImage("martinbb.png")

local JOHN_IMAGE = love.graphics.newImage("johnbb.png")
MARTIN_HEIGHT = 70
MARTIN_WIDTH = 70
MARTIN_SPEED = 100

function Martin:init(y)
    self.x = VIRTUAL_WIDTH
    self.y = y
    self.width = MARTIN_IMAGE:getWidth()
    self.height = MARTIN_HEIGHT
    self.remove = false
end

function Martin:render()
    love.graphics.draw(MARTIN_IMAGE, self.x, self.y)
end
