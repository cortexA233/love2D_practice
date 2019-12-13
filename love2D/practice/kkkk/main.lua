function love.load()
  fps=1
  x=0
  createtime=0
  a={}
  recs={}
end

function love.draw()
  if fps<50 then
    love.graphics.print("fps too low!："..fps,0,0)
  else
    love.graphics.print("fps:"..fps,0,0)
  end
  for i=1,#recs do
    love.graphics.rectangle("line",recs[i].bex,recs[i].bey,recs[i].a,recs[i].b)
  end
end

function love.update(dt)
  -------帧率监测--------
  fps=1/dt
  if fps<40 then
    print("fps too low!:"..fps,0,0)
  else
    print("fps:"..fps,0,0)
  end
  -----------------------
  
  if love.keyboard.isDown("d") then
    for i=1,#recs do
      recs[i].bex=recs[i].bex+5
    end
  end
end

function love.keypressed(keyid)
  if keyid=="space" then
    create()
  end
end

function create()
  rec={}
  rec.bex=50
  rec.bey=50+50*createtime
  rec.a=65
  rec.b=40
  createtime=createtime+1
  table.insert(recs,rec)
end