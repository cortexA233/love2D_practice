object=require("class")

player1=object.extend(object)

function player1.new(self,x,y)
  self.x=x
  self.y=y
  self.pic=love.graphics.newImage("rightmove1.png")
  self.spd=0
end

function player1:draw()
  love.graphics.draw(self.pic,self.x,self.y,0,3,3)
end

function player1:fall()
  self.y=self.y+self.spd
end
