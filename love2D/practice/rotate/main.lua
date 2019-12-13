function love.load()
  spx=10
  spy=10
  mx=0
  my=0
  sx=0
  sy=0
  ex=20
  ey=20
  len=25
end

function love.draw()
  love.graphics.circle("line",sx,sy,15)
  rr=pointdis(sx,sy,mx,my)
  if(rr~=0) then
    love.graphics.line(sx,sy,sx+len*(mx-sx)/rr,sy+len*(my-sy)/rr)
  else
    love.graphics.line(sx,sy,sx+len,sy)
  end
end

function love.update()
  mx,my=love.mouse.getPosition()
  if(mx-sx>0) then
    spx=3.5
  else
    spx=-3.5
  end
  if(my-sy>0) then
    spy=3.5
  else
    spy=-3.5
  end
  if(math.abs(pointdis(mx,my,sx,sy))<=10) then
    sx=mx
    sy=my
  else
    sy=sy+spy
    sx=sx+spx
  end
end

function love.mousepressed(x,y,key)
  mx=x
  my=y
end

function pointdis(x1,y1,x2,y2)
  disx=(x1-x2)*(x1-x2)
  disy=(y1-y2)*(y1-y2)
  return math.sqrt(disx+disy)
end


