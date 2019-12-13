function love.load()
--  love.graphics.setScissor(0,0,222,222)
  
end

function love.update()
  canv=love.graphics.newCanvas()
  love.graphics.setCanvas(canv)
  love.graphics.rectangle("fill",2,2,100,100)
  love.graphics.setCanvas()
end


function love.draw()
  love.graphics.draw(canv
  love.graphics.circle("line",100,100,133)
end


