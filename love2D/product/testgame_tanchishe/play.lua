Object=require("class")
play=Object.extend(Object)

function play.new(self,x,y)
  self.sx=x
  self.sy=y
  self.r=10
end

function play.draw(self)
  love.graphics.circle("fill",self.sx,self.sy,self.r)
end

function play.overf(self)
  if self.sx-10<=25 or self.sy-10<=25 or self.sx+10>=775 or self.sy+10>=575 then
    return 1
  end
  return 0
end


