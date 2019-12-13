object=require("class")

wall=object.extend(object)

function wall.new(self,x,y)
  self.x=x
  self.y=y
  self.len=150
  self.h=10
end

function wall:draw()
  love.graphics.rectangle("line",self.x,self.y,self.len,self.h)
end

