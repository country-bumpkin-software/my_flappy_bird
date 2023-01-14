Bird = Class{}

local GRAVITY = 10
groundHitSound = love.audio.newSource("explosion.wav", "static")
jumpSound = love.audio.newSource("jump.wav", "static")
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
        love.audio.play(jumpSound)
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

function Bird:collides(pipe)
    if (self.x + 2) + (self.width - 4) >= pipe.x and self.x + 2 <= pipe.x + PIPE_WIDTH then
        if (self.y + 2) + (self.height - 4) >= pipe.y and self.y + 3 <= pipe.y + PIPE_HEIGHT then
            return true
        end
    end

    -- if (self.y) + (self.height) >= VIRTUAL_HEIGHT -16 then
    --     print(self.y)
    --     return true
    -- end
    return false
end

function Bird:hitGround()
    if (self.y) + (self.height) >= VIRTUAL_HEIGHT - 10 then
        love.audio.play(groundHitSound)
        return true
    end    
end


