local code1 = [[
extern vec2 pos;
#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
    vertex_position += pos;
    return transform_projection * vertex_position; 
}
#endif
]]
local code2 = [[
extern vec4 rect;
#ifdef PIXEL
vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
{
 	if (screen_coords.x < rect.x || screen_coords.x > rect.x + rect.z
 		|| screen_coords.y< rect.y || screen_coords.y > rect.y + rect.w) {
 		return vec4(1.0,0.0,0.0,0.0);
 	}
 	else
 	{
 		return vec4(1.0,1.0,0.0,1.0);
 	}	
}
#endif
]]
local code3 = [[
#ifdef PIXEL
vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 texcolor = Texel(texture, texture_coords);
    texcolor.rgb = texcolor.rgb/2;
    return texcolor * color;
}
#endif
]]
local code4 = [[
#ifdef PIXEL
vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 texcolor = Texel(texture, texture_coords);
    if (screen_coords.x > 400) {
    	return vec4(1.0 - texcolor.r,1.0 - texcolor.g,1.0 - texcolor.b, texcolor.a );  	
    }
	else
	{
		return texcolor;
	} 
}
#endif
]]
function love.load()
	image = love.graphics.newImage("logo.png")
	shader1 = love.graphics.newShader(code1)
	shader1:send("pos",{100,100})
	shader2 = love.graphics.newShader(code2)
	shader2:send("rect",{300,100,100,100})
	shader3 = love.graphics.newShader(code3)
	shader4 = love.graphics.newShader(code4)
	love.graphics.setBackgroundColor(100, 100, 100, 255)
end
function love.draw() 
	love.graphics.setShader(shader1)
	love.graphics.draw(image)
	love.graphics.setShader()
	love.graphics.setShader(shader2)
	love.graphics.rectangle("fill", 0,0, love.graphics.getWidth(), love.graphics.getHeight())
	love.graphics.setShader()
	love.graphics.setShader(shader3)
	love.graphics.draw(image,500,100)
	love.graphics.setShader()
	love.graphics.setShader(shader4)
	love.graphics.draw(image,love.mouse.getX(),love.mouse.getY())
	love.graphics.setShader()
end