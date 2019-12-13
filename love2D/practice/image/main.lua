function love.load()
  ima=love.graphics.newImage("exam.png");
end

function love.draw()
  --love.graphics.setColor(0.2,0.4,0.1)
  love.graphics.rectangle("line",0,0,222,222)
  love.graphics.draw(ima,100,100,0,0.4,0.4,0,0,0,0)
end

