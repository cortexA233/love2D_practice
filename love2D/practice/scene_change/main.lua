require("openscene")
object=require("classic")

function love.load()
  isbegin=0
  cur_sce=0
end

function love.draw()
  if(cur_sce==0) then
    draw_openscene()
  end
  if(cur_sce==1) hen
    draw_sce1()
  end
end

function love.update(dt)
  
end

function love.keypressed(k)
  if(isbegin==0) then
    isbegin=1
    cur_sce=1
  end
  if(cur_sce==1) then
    
  end
  
end


