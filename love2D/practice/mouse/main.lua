function love.load()
  tx=0
  ty=0
  mx=333
  my=333
  sx=44
  sy=44
  speedx=0
  speedy=0
  delt=0
end

function love.draw()
  love.graphics.circle("line",sx,sy,33)
end

function love.mousepressed(x,y,key)
  if(key==1) then
    print(speedx)
    print(speedy)
    mx=x
    my=y
  end
end


function love.update(dt)
  delt=dt
  tx=mx-sx
  if(tx>0) then
    sx=10+sx
  else
    sx=sx-10
  end
  if(math.abs(tx)<=10) then
    sx=mx
  end
  
  ty=my-sy
  if(ty>0) then
    sy=10+sy
  else
    sy=sy-10
  end
  if(math.abs(ty)<=10) then
    sy=my
  end
end
