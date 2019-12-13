object=require("class")

player=object.extend(object)

function player.new(self,x,y)
  self.x=x
  self.y=y
  self.r=20
  self.spd=0
end

function player:draw()
  love.graphics.rectangle("fill",self.x,self.y,self.r,self.r)
end

function player:fall()
  self.y=self.y+self.spd
end
