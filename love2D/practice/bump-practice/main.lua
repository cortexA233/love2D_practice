function love.load()
  local bump = require 'bump'
  
  world = bump.newWorld(50)
  
  a={x=0,y=0,w=100,h=100,sx=5,sy=5}
  b={x=555,y=400,w=200,h=200}
  print(a.x)
  vx=5
  vy=5
  px=a.x
  py=a.y
  world:add(a,a.x,a.y,a.w,a.h)
  world:add(b,b.x,b.y,b.w,b.h)
end


function poschan(tar)
  local ax,ay,cols,len=world:move(a,px,py)
  px=px+vx
  py=py+vy
  a.x=ax
  a.y=ay
end


function love.update(dt)
  poschan(a)
end


function love.draw()
  love.graphics.rectangle("line",a.x,a.y,a.w,a.h)
  love.graphics.rectangle("line",b.x,b.y,b.w,b.h)
end
