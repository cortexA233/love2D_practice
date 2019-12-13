Object=require("class")
food=Object.extend(Object)

function food.new(self,x,y)
  self.sx=x
  self.sy=y
  self.r=10
end

function food.draw(self)
  love.graphics.circle("line",self.sx,self.sy,self.r)
end

function food.iseat()
  
end


