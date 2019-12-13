function ini1()
  math.randomseed(os.time())
  for i=1,10 do
    world:remove(wal[i])
  end
  
  pl.spd=0
  pl.x,pl.y=world:move(pl,633,333)
  pl1.pic=love.graphics.newImage("dango1.png")
  pl1.x,pl1.y=world:move(pl,633,333)
  for i=1,10 do
    if(i>1) then
      wal[i]=wall(wal[i-1].x+math.random(-200,200),wal[i-1].y+100)
    else
      wal[1]=wall(633,353)
    end
    if(wal[i].x<=310) then
      wal[i].x=wal[10].x+math.random(22,200)
    end
    if(wal[i].x>=1140) then
      wal[i].x=wal[10].x+math.random(-200,-22)
    end
    world:add(wal[i],wal[i].x,wal[i].y,wal[i].len,wal[i].h/10)
  end
  score=0
  score_temp=0
  isbegin=0
  ispause=0
  islost=0
end

function scene1_draw()
  love.graphics.rectangle("line",300,-1,1000,1000)
  love.graphics.print("YOUR SCORE:"..score,0,0,0,2,2)
  pl1:draw()
  for i=1,10 do
    wal[i]:draw()
  end
  if(isbegin==0 or islost==1) then
    love.graphics.print("PRESS SPACE TO START",700,400,0,2,2)
  end
end


function scene1_update(dt)
  if(pl.y>900) then
    isbegin=0
    islost=1
  end
  if(isbegin==1 and islost==0 and ispause==0) then
    score_temp=score_temp+dt
    if(score_temp>=1) then
      score=score+1
      score_temp=0
    end
    came_len=came_len-dt
    cameramove1(dt)
    local ax,ay,col,l=world:move(pl,pl.x,pl.y+pl.spd)
    pl1.y=ay
    pl.y=ay
    if(l<1) then
      pl.spd=pl.spd+10*dt
      pl1.spd=pl1.spd+10*dt
    else
      pl.spd=0
      pl1.spd=0
    end
    if(love.keyboard.isDown("a")) then
      local ax,ay,col,l=world:move(pl,pl.x-300*dt,pl.y)
      local ax1,ay1,col1,l1=world:move(pl1,pl1.x-300*dt,pl1.y)
      pl.x=ax
      pl1.x=ax1
    end
    if(love.keyboard.isDown("d")) then
      local ax,ay,col,l=world:move(pl,pl.x+300*dt,pl.y)
      local ax1,ay1,col1,l1=world:move(pl1,pl1.x+300*dt,pl1.y)
      pl.x=ax
      pl1.x=ax1
    end
  else
    love.graphics.print("PRESS SPACE TO START")
  end
  for i=1,10 do
    if(wal[i].y<0) then
      if(i==1) then
        world:remove(wal[i])
        wal[i].x=wal[10].x+math.random(-200,200)
        if(wal[i].x<=310) then
          wal[i].x=wal[i].x+math.random(22,200)
        end
        if(wal[i].x>=1140) then
          wal[i].x=wal[i].x+math.random(-200,-22)
        end
        wal[i].y=wal[10].y+100
        world:add(wal[i],wal[i].x,wal[i].y,wal[i].len,wal[i].h/10)
        
      else
        world:remove(wal[i])
        wal[i].x=wal[10].x+math.random(-200,200)
        if(wal[i].x<=290) then
          wal[i].x=wal[i].x+math.random(22,200)
        end
        if(wal[i].x>=1190) then
          wal[i].x=wal[i].x+math.random(-200,-22)
        end
        wal[i].y=wal[i-1].y+100
        world:add(wal[i],wal[i].x,wal[i].y,wal[i].len,wal[i].h/10)
      end
    end
  end
end

function cameramove1(s)
  local bx,by,col1,l1=world:move(pl,pl.x,pl.y-160*s)
  pl.y=by
  for i=1,10 do
    local ax,ay,col,l=world:move(wal[i],wal[i].x,wal[i].y-160*s)
    wal[i].y=ay
  end
  --love.graphics.translate(1,s*100)
end
