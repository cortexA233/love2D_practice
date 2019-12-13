function love.load()
  came_len=0
  love.window.setMode(1600,900)
  
  require("scene1")
  require("others")
  require("class")
  require("player")
  require("player1")
  bump=require("bump")
  require("wall")
  world=bump.newWorld(50)
  cur_scene=0
  
  pl=player(633,333)
  pl1=player1(633,633)
  world:add(pl,pl.x,pl.y,pl.r,pl.r)
  
  score=0
  score_temp=0
  ispause=0
  isbegin=0
  islost=0
  
  wal={}
  wal[1]=wall(633,353)
  world:add(wal[1],wal[1].x,wal[1].y,wal[1].len,wal[1].h/10)
  math.randomseed(os.time())
  for i=2,10 do
    wal[i]=wall(wal[i-1].x+math.random(-200,200),wal[i-1].y+100)
    if(wal[i].x<=310) then
      wal[i].x=wal[i].x+math.random(22,200)
    end
    if(wal[i].x>=1140) then
      wal[i].x=wal[i].x+math.random(-200,-22)
    end
    world:add(wal[i],wal[i].x,wal[i].y,wal[i].len,wal[i].h/10)
  end
end

function love.update(dt)
  if(cur_scene==1) then
    scene1_update(dt)
  end
end

function love.draw()
  if(cur_scene==0) then
    love.graphics.print("PRESS SPACE TO START",700,400,0,2,2)
  end
  if(cur_scene==1) then
    scene1_draw()
  end
end

function love.keypressed(k)
  if(k=="escape") then
    if(ispause==1) then
      ispause=0
    else
      ispause=1
    end
  end
  if(k=="space") then
    if(cur_scene==0) then
      cur_scene=1
    end
    if(isbegin==0) then
      isbegin=1
      cur_scene=1
    end
    if(islost==1) then
      ini1()
    end
  end
end

