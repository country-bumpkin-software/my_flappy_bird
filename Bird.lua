Bird = Class{}

local GRAVITY = 10

function Bird:init()
    self.image = love.graphics.newImage('bird.png')
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    -- position bird in the middle of the screen
    self.x = VIRTUAL_WIDTH / 2 - (self.width / 2)
    self.y = VIRTUAL_HEIGHT / 2 - (self.height / 2)

    -- Y velocity; gravity
    self.dy = 0
end

function Bird:update(dt)
    -- apply gravity to velocity
    self.dy = self.dy + GRAVITY * dt

    if love.keyboard.wasPressed('space') then
        if self.dy < -1 then
            -- we don't want the bird shooting up un controllably
        else
            self.dy = self.dy - 4.5
        end
    end
    -- apply current velocity to Y position
    self.y = self.y + self.dy
end

function Bird:render()
    love.graphics.draw(self.image, self.x, self.y)
end

