local bump=require("bump")
local object=require("class")

tstid=0

function love.load()
  score=0
  time_boost=200
  time_boost_max=200
  ax=0
  ay=0
  world=bump.newWorld(32)
  a={x=400,y=70,w=4,h=4}
  speed=1
  sx=400
  sy=70
  len=50
  rot=0
  fl=1
  temfl=1
  isback=0
  b={{}}
  math.randomseed(os.time()%100)
  for i=1,5 do
    b[i]={x=math.random(100,700),y=math.random(200,400),w=math.random(50,99),h=math.random(50,99),exi=1,id=i,iscol=0,isdel=0,scr=0}
    b[i].scr=math.floor(b[i].w*b[i].h/1000)*100
    world:add(b[i],b[i].x,b[i].y,b[i].w,b[i].h)
  end
  goldnum=5
  world:add(a,a.x,a.y,a.w,a.h)
  ex,ey=love.mouse.getPosition()
end

function love.update()
  if(love.keyboard.isDown("space") and time_boost>0) then
    time_boost=time_boost-1
    speed=0.5
  else
    if(time_boost<time_boost_max) then
      time_boost=time_boost+0.3
    else
      time_boost=200
    end
    speed=1
  end
  
  
  if(love.keyboard.isDown("a")) then
    sx=sx-2*speed
  end
  if(love.keyboard.isDown("d")) then
    sx=sx+2*speed
  end
  if(goldnum<2) then
    b[#b+1]={}
    b[#b]={x=math.random(100,700),y=math.random(200,400),w=math.random(50,99),h=math.random(50,99),exi=1,id=i,iscol=0,isdel=0,scr=0}
    world:add(b[#b],b[#b].x,b[#b].y,b[#b].w,b[#b].h)
    b[#b].scr=math.floor(b[#b].w*b[#b].h/1000)*100
    goldnum=goldnum+1
  end
  
----------------钩子---------------
  ex=sx+len*math.cos(rot)
  ey=sy+len*math.sin(rot)
  a.x=ex
  a.y=ey
  if(rot<0.14 and fl==-1) then
    fl=1
    isback=0
  end
  if(rot>3 and fl==1) then
    fl=-1
    isback=0
  end
  if(fl==0) then
    if(len>600) then
      isback=1
    end
    
    if(num~=0) then
      num1=1
    end
    rope(1)
    if(len<=50) then
      fl=temfl
      len=50
      isback=0
    end
  end
  rot=rot+0.02*fl*speed
-----------------钩子----------------
  for i=1,#b do
    if(b[i].exi==0 and b[i].isdel==0) then
      goldnum=goldnum-1
      world:remove(b[i])
      b[i].isdel=1
      score=score+b[i].scr
    end
    
    if(b[i].iscol==1) then
      b[i].x=ex
      b[i].y=ey
    end
    if(b[i].y<=120) then
      b[i].exi=0
    end
  end
end

function love.draw()
  ------时间槽-------
  if(time_boost==time_boost_max) then
    love.graphics.setColor(0,1,0,1)
    love.graphics.rectangle("line",500,20,time_boost_max,15)
    love.graphics.rectangle("fill",500,20,time_boost,15)
  else
    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle("line",500,20,time_boost_max,15)
    love.graphics.rectangle("fill",500,20,time_boost,15)
  end
  love.graphics.setColor(1,1,1,1)
  -------积分--------
  love.graphics.print("score:"..score,0,0,0,3,3)
  love.graphics.circle("line",sx,sy,20)
  love.graphics.circle("fill",sx+len*math.cos(rot),sy+len*math.sin(rot),3)
  love.graphics.line(sx,sy,sx+len*math.cos(rot),sy+len*math.sin(rot))
  for i=1,#b do
    if(b[i].exi==1) then
      disp(i)
    end
  end
  love.graphics.rectangle("fill",ex-a.w/2,ey-a.h/2,a.w,a.h)
end

function love.mousepressed(x,y,key)
  if(key==1 and fl~=0) then
    temfl=fl
    fl=0
  end
end

function disp(id)
  love.graphics.rectangle("line",b[id].x,b[id].y,b[id].w,b[id].h)
  love.graphics.print(b[id].scr,b[id].x+b[id].w/2,b[id].y+b[id].h/2)
end

function love.keypressed(k)
  if(k=="space" and fl==1) then
    
  end
end


function rope(mar)
  if(isback==0) then
    len=len+8*mar*speed
  else
    len=len-8*mar*speed
  end
  ax,ay,coli,colnum=world:move(a,sx+len*math.cos(rot),sy+len*math.sin(rot))
  if(colnum>0) then
    coli[1].other.iscol=1
    tstid=coli[1].other.iscol
  end
  
  if(ay~=sy+len*math.sin(rot) or ax~=sx+len*math.cos(rot)) then
    isback=1
  end

end



