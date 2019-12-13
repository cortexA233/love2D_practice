function love.load()
 -- require("classic")
  
end

rect=Object.extend(Object)

function rect.new(self,a,b)
  self.speed=10
  self.a=a
  self.b=b
  self.x=222
  self.y=222
  self.test=math.random(2,222222)
end

function rect.draw()
  love.graphics.rectangle("line",r1.x,r1.y,r1.a,r1.b)
end
