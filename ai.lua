

AI = {}

function AI:load()
    self.width = 20
    self.height = 100
    self.x = love.graphics.getWidth() - self.width - 50
    self.y = love.graphics.getHeight() / 2
    self.yVel = 0
    self.speed = 500

    -- Makes the AI more human
    self.timer = 0
    self.rate = 0.5
end

function AI:update(dt)
    self:move(dt)
    self.timer = self.timer + dt
    -- Makes a delay so there is a smoother transtion
    if self.timer > self.rate then
        self.timer = 0
        self:acquireTarget()
    end
end

-- AI moves based on velocity

function AI:move(dt)
    self.y = self.y + self.yVel * dt
end

-- Will decide on where to move based on ball position
-- The speed and velocity will change until if statement is not met to match ball
function AI:acquireTarget()
    if Ball.y + Ball.height < self.y then
        self.yVel =-self.speed
    elseif Ball.y > self.y + self.height then
        self.yVel = self.speed
    else
        self.yVel = 0
    end
end




function AI:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

end