-- Call Player file & Ball file

require("player")
require("ball")
require("ai")

-- Add Player functions to its correspondances

-- Load data assets at start of the game
function love.load()
    Player:load()    
    Ball:load()
    AI:load()

    -- Set intial score
    Score = {player = 0, ai = 0}
    font = love.graphics.newFont(30)
end

-- Game Logic that will need to update and trigger 1 time per frame
function love.update(dt)
    Player:update(dt) 
    Ball:update(dt)
    AI:update(dt)
end

-- Display graphics on screen & score (and coordinates)
function love.draw()
    Player:draw()
    Ball:draw()
    AI:draw()
    drawScore()
end

-- Font of score and score details
function drawScore()
    love.graphics.setFont(font)
    love.graphics.print("Player: "..Score.player, 50, 50)
    love.graphics.print("AI: "..Score.ai, 1000, 50)
end

-- See if there is a collision
function checkCollision(a, b)
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true
    else
        return false
    end

end
