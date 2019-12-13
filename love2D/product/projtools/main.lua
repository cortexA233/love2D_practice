function love.load()
  require("dot")
  require("class")
  ima=love.graphics.newImage("map1.jpg")
  love.window.setMode(1600,900) 
  sx={}
  sy={}
  isprinted=0
  iserr=0
  d1={}
  cur=1
  n=0
  p1={0,0}
  isl={}
  for i=1,50 do
    isl[i]={}
  end
  for i=1,50 do
    for o=1,50 do
      isl[i][o]=0
    end
  end
end

function love.draw()
  love.graphics.draw(ima)
  if(isprinted==1) then
    love.graphics.setColor(0,0,0)
    love.graphics.print("Print successfully!",1200,800,0,3,3)
    love.graphics.setColor(1,1,1)
  end
  
  
  love.graphics.setColor(0,0,0)
  if(n>0) then
    love.graphics.print("position for index ("..n.."):  "..sx[n].."  "..sy[n],0,800,0,3,3)
  end
  love.graphics.setColor(1,1,1)
  if(iserr==1) then
    love.graphics.setColor(0,0,0)
    love.graphics.print("Error! Please press space to recover",0,0,0,3,3)
    love.graphics.setColor(1,1,1)
  else
    love.graphics.setColor(0,0,0)
    love.graphics.print(p1[1].."              "..p1[2],0,0,0,3,3)
    love.graphics.setColor(1,1,1)
  end
  for i=1,n do
    d1[i]:draw(1)
  end
  for i=1,50 do
    for o=1,50 do
      if(isl[i][o]==1) then
        love.graphics.setColor(0,0,0)
        love.graphics.line(d1[i].x,d1[i].y,d1[o].x,d1[o].y)
        love.graphics.setColor(1,1,1)
      end
    end
  end
end

function love.update(dt)
  for i=1,2 do
    if(p1[i]>50 or p1[i]>n) then
      iserr=1
    end
  end
end

function love.keypressed(k)
  if(k=="r") then
    table.remove(d1,n)
    n=n-1
  end
  if(k>="0" and k<="9") then
    p1[cur]=p1[cur]*10
    p1[cur]=p1[cur]+k-"0"
  end
  if(k=="space") then
    if(iserr==1) then
      cur=1
      p1[1]=0
      p1[2]=0
      iserr=0
    else
      if(cur==1) then
        cur=2
      else
        cur=1
        if(isl[p1[1]][p1[2]]==1 or isl[p1[2]][p1[1]]==1) then
          isl[p1[1]][p1[2]]=0
          isl[p1[2]][p1[1]]=0
        else
          isl[p1[1]][p1[2]]=1
          isl[p1[2]][p1[1]]=1
        end
        p1[1]=0
        p1[2]=0
      end
    end
  end
  if(k=="p") then
    f=io.open("out.txt","a")
    for i=1,50 do
     -- f:write(i..":")
      for o=1,50 do
        f:write(isl[i][o].." ")  
      end
      f:write("\n")
    end
    f:close()
    f=io.open("out1.txt","a")
    for i=1,n do
      f:write(sx[i].." "..sy[i].."\n")
    end
    isprinted=1
  else
    isprinted=0
  end
end


function love.mousepressed(x,y,k)
  n=n+1
  sx[n],sy[n]=love.mouse.getPosition()
  temp=dot(sx[n],sy[n],n)
  table.insert(d1,temp)
end

