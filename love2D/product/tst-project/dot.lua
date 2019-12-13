Object=require("class")
dot=Object.extend(Object)

function dot.new(self,x,y,num)
  self.x=x
  self.y=y
  self.r=15
  self.num=num
end

function dot.draw(self,fl)
  if(fl==1) then
    love.graphics.setColor(0,1,0)
  else
    love.graphics.setColor(0,0.05,0.75)
  end
  love.graphics.circle("fill",self.x,self.y,self.r)
  love.graphics.setColor(1,1,1)
  if(self.num<10) then
    if(fl==1) then
      love.graphics.setColor(0,0,0)
    end
    love.graphics.print(0,self.x-7.5,self.y-7.5,0,1.1,1.1)
    love.graphics.print(self.num,self.x+0.5,self.y-7.5,0,1.1,1.1)
  else
    if(fl==1) then
      love.graphics.setColor(0,0,0)
    end
    love.graphics.print(self.num,self.x-7.5,self.y-7.5,0,1.1,1.1)
  end
  love.graphics.setColor(1,1,1)
end

function dot.link(d1,d2)
  love.graphics.line(d1.x,d1.y,d2.x,d2.y)
end

