function love.load()
  Object=require("classic")
 -- require("classic")
  require("rect")
  r1=rect(100,200)
end

function love.draw()
  r1.draw()
end

function love.update(dt)
  r1.x=r1.x+r1.speed
end


