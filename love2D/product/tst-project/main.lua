function love.load()
  sss=io.input("info.projin")
  ima=love.graphics.newImage("map1.jpg")
  bb=love.graphics.newImage("BBboy.jpg")
  camescalex=1
  camescaley=1
  cameposx=0
  cameposy=0
  require("dot")
  require("class")
  gscale=1
--  love.window.setFullscreen(true)
  love.window.setMode(1600,900) 
  isdrawed=0
  iscomputed=0
  iserr=0
  dotr=15
  d1={}
  isl={{}}
  for i=1,50 do
    isl[i]={}
  end
  dp={{}}
  dp2={{}}
  mart={{}}
  for i=1,60 do
    dp2[i]={}
    dp[i]={}
    isl[i]={}
    mart[i]={}
  end
  road={}
  road2={}
  ini1()
  num={0,0}
  num_id=1
end

function love.draw()
  love.graphics.draw(ima,cameposx,cameposy,0,camescalex,camescaley)
  love.graphics.setColor(0,0,0)
--[[  love.graphics.draw(bb,1100,400,0,1,1)
  love.graphics.print(num[1].." "..num[2].."?",900,110,0,3,3)
  love.graphics.print(#road.."!!!",1200,0,0,3,3)
  for i=1,#road do
    love.graphics.print(road[i].."!",1200,50*i,0,3,3)
  end
 -- road2[#road2]=num[2]
  love.graphics.print(#road2,900,110,0,3,3)
  for i=1,#road do
    love.graphics.print(road[i].."!",100,50*i,0,3,3)
  end
  love.graphics.setColor(0,0,0)
  love.graphics.print("cpx:"..cameposx,477)
  love.graphics.print("cpy:"..cameposy,477,11)
  love.graphics.print("csx:"..camescalex,477,22)
  love.graphics.print("csy:"..camescaley,477,33)
  love.graphics.setColor(1,1,1)
  love.graphics.print(isl[36][35],477)
  love.graphics.print(isl[35][36],477,11)]]
  
  love.graphics.translate(cameposx,cameposy)
  love.graphics.scale(camescalex,camescaley)
  if(iserr==1) then
    love.graphics.setColor(0,0,0)
    love.graphics.print("Error! Press R to reset the program",930,1,0,3,3)
    love.graphics.setColor(1,1,1)
  end
  
  if(iscomputed==0 and iserr==0) then
    for i=1,50 do
      for o=1,50 do
        if(isl[i][o]==1) then
          love.graphics.setColor(0,0,0)
          love.graphics.line(d1[i].x , d1[i].y , d1[o].x , d1[o].y)
        end
        if(isl[i][o]==2) then
         --[[ if(i<40) then
            love.graphics.print(i.."-"..o.."!",i*44)
          else
            love.graphics.print(i.."-"..o.."!",o*44,33)
          end]]--
          
          love.graphics.setColor(1,0,0)
          love.graphics.line(d1[i].x , d1[i].y , d1[o].x , d1[o].y)
          love.graphics.setColor(0,0,0)
        end
      end
    end   
    love.graphics.print("Please enter the index:\n",1111,1,0,3,3)
    love.graphics.print(num[1],200+1111,50,0,3,3)
    love.graphics.print(num[2],300+1111,50,0,3,3)
    love.graphics.setColor(1,1,1)
  end
  for i=1,50 do
    d1[i]:draw()
  end
  if(iscomputed==1) then
    love.graphics.setColor(0,0,0)
  --  road[1]=num[1]
    love.graphics.print("The result is ",1111,1,0,3,3)
    love.graphics.print(string.format("%.3f",dp2[num[1]][num[2]]).."(without bike) and",1111,50,0,3,3)
    love.graphics.print(string.format("%.3f",dp[num[1]][num[2]]).."(with bike)",1111,100,0,3,3)
    if(isdrawed==0) then
      isdrawed=1
      dfs2(num[1],num[2])
      dfs(num[1],num[2])
    end
    love.graphics.print("Press R to reset the \n program",1111,200,0,3,3)
    for i=1,#road-1 do
      d1[road[i]]:draw(1)
      love.graphics.setColor(0,0,0)
      love.graphics.line(d1[road[i]].x , d1[road[i]].y , d1[road[i+1]].x , d1[road[i+1]].y)
      love.graphics.setColor(1,1,1)
    end
    for i=1,#road2-1 do
      love.graphics.setColor(0,0,0)
      love.graphics.setColor(0,1,0)
      love.graphics.line(d1[road2[i]].x , d1[road2[i]].y , d1[road2[i+1]].x , d1[road2[i+1]].y)
      love.graphics.setColor(1,1,1)
    end
    love.graphics.setColor(1,1,1)
    d1[road[#road]]:draw(1)
  end
  love.graphics.setColor(1,1,1)
end

function love.update(dt)
  --摄像机调整--
  if(cameposx>0) then
    cameposx=0
  end
  if(cameposy>0) then
    cameposy=0
  end
  if(cameposx/camescalex-1600/camescalex/camescalex<-1600) then
    cameposx=cameposx+15
  end
  if(cameposy/camescaley-900/camescaley/camescaley<-900) then
    cameposy=cameposy+15
  end
  if(love.keyboard.isDown("w")) then
    if(cameposy<=0 and cameposy/camescaley-900/camescaley/camescaley>-900) then
      cameposy=cameposy+10
    end
  end
  if(love.keyboard.isDown("a")) then
    if(cameposx<=0 and cameposx/camescalex/camescalex/camescalex-1600/camescalex/camescalex/camescalex>-1600) then
      cameposx=cameposx+10
    end
  end
  if(love.keyboard.isDown("s")) then
    if(cameposy<=0 and cameposy-900/camescaley/camescaley>-900) then
      cameposy=cameposy-10
    end
  end
  if(love.keyboard.isDown("d")) then
    if(cameposx<=0 and cameposx/camescalex/camescalex/camescalex-1600/camescalex/camescalex/camescalex>-1600) then
      cameposx=cameposx-10
    end
  end
  if(love.keyboard.isDown("j")) then
    camescalex=camescalex+1*dt
    camescaley=camescaley+1*dt
  end
  if(love.keyboard.isDown("k")) then
    if(camescalex>1) then
      camescalex=camescalex-1*dt
      camescaley=camescaley-1*dt
    else
      camescalex=1
      camescaley=1
    end
  end
  ------------------------------
end
  
function ini()
  camereset()
  isdrawed=0
  road={}
  road2={}
  iserr=0
  iscomputed=0
  num_id=1
  num[1]=0
  num[2]=0
end

function ini1()
  sss=io.input("info1.txt")
  for i=1,50 do
    tx=io.read("*n")
    ty=io.read("*n")
    temp=dot(tx,ty,i)
    table.insert(d1,temp)
  end
  floyd2()
  floyd()
end

function love.keypressed(k)
  if(k=="r") then
    ini()
  end
  if(iscomputed==0 and iserr==0) then
    if(k=='q') then
      love.window.setFullscreen(false)
    end
    if(k>='0' and k<='9') then
      num[num_id]=num[num_id]*10
      num[num_id]=num[num_id]+k-'0'
      if(num[num_id]>=51) then
        iserr=1
      end
    end
    
    if(k=="space") then
      if(num_id==2) then
        if(num[2]==0) then
          iserr=1
        else
          numid=1
          iscomputed=1
        end
      else
        if(num[1]==0) then
          iserr=1
        end
        num_id=2
      end
    end
  end
end

---------------杂七杂八------------------
function jud(sx,sy)
  flag=1
  for i=1,#d1 do
    if(pointdis(sx,sy,d1[i].x,d1[i].y)<=6*dotr) then
      flag=0
      break
    end
  end
  return flag
end

function pointdis(x1,y1,x2,y2)
  disx=(x1-x2)*(x1-x2)
  disy=(y1-y2)*(y1-y2)
  return math.sqrt(disx+disy)
end
--------------------------------------

-------------最短路及寻路-------------
function floyd()
  for i=1,50 do
    for o=1,50 do
      if(isl[i][o]>=1) then
        dp[i][o]=pointdis(d1[i].x,d1[i].y,d1[o].x,d1[o].y)
      else
        dp[i][o]=111111111
      end
      if(i==o) then
        dp[i][o]=0
      end
      if(isl[i][o]==2) then
        dp[i][o]=pointdis(d1[i].x,d1[i].y,d1[o].x,d1[o].y)/2
      end
      mart[i][o]=dp[i][o]
      mart[o][i]=dp[i][o]
      dp[o][i]=dp[i][o]
    end
  end
  print(dp[1][1])
  for p=1,50 do
    for i=1,50 do
      for o=1,50 do
        if(dp[i][o]>dp[i][p]+dp[p][o]) then
          dp[i][o]=dp[i][p]+dp[p][o]
        end
      end
    end
  end
end
function dfs(st,en)
  road2[#road2+1]=st
  if(st==en) then
    return 
  end
  for i=1,50 do
    if(i==st) then
      
    else
      if(math.abs(dp[st][i]+dp[i][en]-dp[st][en])<0.1 and isl[st][i]>=1) then
        print(i)
     --   print("\n")
        dfs(i,en)
        break
      end
    end
  end
end

function floyd2()
  sss=io.input("info.projin")
  for i=1,50 do
    for o=1,50 do
      isl[i][o]=io.read("*n")
    end
  end
  for i=1,50 do
    for o=1,50 do
      if(isl[i][o]>=1) then
        dp2[i][o]=pointdis(d1[i].x,d1[i].y,d1[o].x,d1[o].y)
      else
        dp2[i][o]=111111111
      end
      if(i==o) then
        dp2[i][o]=0
      end
      mart[i][o]=dp2[i][o]
      mart[o][i]=dp2[i][o]
      dp2[o][i]=dp2[i][o]
    end
  end
  print(dp2[1][1])
  for p=1,50 do
    for i=1,50 do
      for o=1,50 do
        if(dp2[i][o]>dp2[i][p]+dp2[p][o]) then
          dp2[i][o]=dp2[i][p]+dp2[p][o]
        end
      end
    end
  end
end
function dfs2(st,en)
  road[#road+1]=st
  if(st==en) then
    return 
  end
  for i=1,50 do
    if(i==st) then
      
    else
      if(math.abs(dp2[st][i]+dp2[i][en]-dp2[st][en])<0.1 and isl[st][i]>=1) then
        print(i)
     --   print("\n")
        dfs2(i,en)
        break
      end
    end
  end
end

function min(a,b)
  if(a<b) then
    return a
  end
  return b
end
-----------------------------

---------摄像机重置---------
function camereset()
  camescalex=1
  camescaley=1
  cameposx=0
  cameposy=0
end

----------------------------



