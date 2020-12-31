-- Create Table with all Player functionality

Player = {}


-- Base Player functions (Using a : allows you to refer to "self" of player)

function Player:load()
    -- Declare where paddle is
    self.x = 50
    -- Use love.graphics.getHeight to get Screen Height since resolution varies per screen
    self.y = love.graphics.getHeight() / 2 
    -- Players width and height
    self.height = 100
    self.width = 20
    -- Speed of player (Pixels per second)
    self.speed = 500
end

function Player:update(dt)
    -- Call Move.Boundary function
    self:move(dt)
    self:checkBoundaries()

end

function Player:move(dt)
    -- Movement of Player
    -- This LOVE function identifies if key is pressed
    if love.keyboard.isDown('w') then
        -- Player position is now set to (y position(i)) - Speed - Delta Time
        self.y = self.y - self.speed * dt
    -- Move down position. We + speed instead of subtracting it
    elseif love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end
end


function Player:checkBoundaries()
    -- Prevent Player from moving past top of window
    if self.y < 0 then
        self.y = 0
    -- Prevent Player from moving past bottom of window
    elseif self.y + self.height > love.graphics.getHeight() then
    -- Check if underside is greater than the window by adding their height into account
    -- Then set y position equal to window height minus the paddle
    self.y = love.graphics.getHeight() - self.height
    end
end

function Player:draw()
-- Create the Player Sprite using args (outline or fill, coordinates, dimensions)
-- This LOVE function creates shape graphics 
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end