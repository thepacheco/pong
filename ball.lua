
Ball = {}

function Ball:load()
    -- Set Ball in the middle
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    -- Width and Height and Speed
    self.width = 20
    self.height = 20
    self.speed = 200
    -- Ball will move based on last collision not input
    -- Ball Velocity
    self.xVel = -self.speed --Move towards player
    self.yVel = 0
end

function Ball:update(dt)
    self:move(dt)
    self:collide()
end

function Ball:collide()
    if checkCollision(self, Player) then
        -- Define when ball and player collide
        self.xVel = self.speed
        -- Have the ball react differently based on top/bottom point of paddle
        local middleBall = self.y + self.height / 2
        local middlePlayer = Player.y + Player.height /2
        local collisionPosition = middleBall - middlePlayer
        self.yVel = collisionPosition * 5 --Angle change
    end

    -- Collision for AI
    if checkCollision(self, AI) then
            -- Define when ball and AI collide and the ball comes back to Player
            self.xVel = -self.speed
            -- Have the ball react differently based on top/bottom point of paddle
            local middleBall = self.y + self.height / 2
            local middleAI = AI.y + AI.height /2
            local collisionPosition = middleBall - middleAI
            self.yVel = collisionPosition * 5 --Angle change
        end

    -- Prevent Ball from leaving area

    if self.y < 0 then
        self.y = 0
        -- This switch in velocity sends the ball back
        self.yVel = -self.yVel
        -- Check if bottom of ball is larger than bottom of window
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.yVel = -self.yVel
    end

    -- Check if wall is hit and reset ball position (Player Point)
    if self.x <0 then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.yVel = 0
        self.xVel = self.speed
        -- Sends ball to AI now
    end

        -- Check if wall is hit and reset ball position (AI Point)
        if self.x + self.width > love.graphics.getWidth() then
            self.x = love.graphics.getWidth() / 2 - self.width / 2
            self.y = love.graphics.getHeight() / 2 - self.height / 2
            self.yVel = 0
            self.xVel = -self.speed
            -- Sends ball to Player now
        end

end




--Change ball position based on velocity
function Ball:move(dt)
    self.x = self.x  + self.xVel * dt
    self.y = self.y + self.yVel * dt
end


function Ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

