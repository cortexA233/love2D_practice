function love.load()
  fl=0
  bex=100
  bey=100
  tick=require("tick")
end

function love.draw()
 -- if(fl~=0) then
    love.graphics.rectangle("line",bex,bey,111,111)
 -- end
end

function love.update(dt)
  tick.update(dt)
  tick.delay(function() fl=1 end,2)
end

function love.keypressed(keyid)
  if(keyid=="space") then
    bex=math.random(100,300);
    bey=math.random(100,300)
  end
end

