jump = 50
xSpike = love.math.random()*400+800
x = 300
speed = 1
playerSkin ="froggy"
jumpKaunter = 1
jumpKauntersave = 1
start = 0
resettime = 3
fallspeed = 1
y = 488
function love.load()
    froggy = love.graphics.newImage(playerSkin..".png")
    floor = love.graphics.newImage("floor.png")
    spike = love.graphics.newImage("spike.png")
    piu = love.audio.newSource("piu.mp3","static")
    startbaton = love.graphics.newImage("start button.png")
    skinbaton = love.graphics.newImage("skin button.png")
end
function love.draw()
    if start == 1 then 
        love.graphics.draw(froggy, 300, y)
        love.graphics.draw(floor, x, 0)
        love.graphics.draw(floor, x+800, 0)
        love.graphics.draw(spike, xSpike+x, 500-2)
    end
    if start == 0 then
        love.graphics.draw(startbaton, 350, 200)
        love.graphics.draw(skinbaton, 350, 500)
        --love.graphics.draw(, x+800, 0)
    end
end
function love.update()
    x=x-speed
    seconds = love.timer.getTime()-resettime
    if x<-800 then x=0 end
    speed = seconds
    if speed > 13 then speed=13 end
    y=y+fallspeed
    if y > 488 then y=488 end
    if y == 488 then jumpKaunter = jumpKauntersave end
    if playerSkin == "froggy" then   jumpKauntersave = 1 fallspeed = 1 end
    if playerSkin == "slime" then  jumpKauntersave = 2 fallspeed = 1 end
    if playerSkin == "anvil" then  jumpKauntersave = 1  fallspeed = 9 end
    if xSpike + x >290 and xSpike + x <310 and y >480 and y <500 then start = 0 speed =0 end
end
function love.keypressed(key, scancode, isrepeat)
   if jumpKaunter > 0 then 
        if key == "space" then
            y=y-jump
            jumpKaunter=jumpKaunter-1 
        
        end
    
    end
end
function love.mousepressed(x, y, button, istouch)
    y = y-50 x = 300
    start = 1 love.audio.play(piu)
    resettime = love.timer.getTime()
end
