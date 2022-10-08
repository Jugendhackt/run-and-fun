jump = 50
xSpike = love.math.random()*400+800
x = 300
speed = 1
playerSkin ="anvil"
jumpKaunter = 1
jumpKauntersave = 1
start = 0
resettime = 3
skin = 0
fallspeed = 1
y = 488
function love.load()
    froggy = love.graphics.newImage("froggy.png")
    floor = love.graphics.newImage("floor.png")
    spike = love.graphics.newImage("spike.png")
    piu = love.audio.newSource("piu.mp3","static")
    startbaton = love.graphics.newImage("start button.png")
    skinbaton = love.graphics.newImage("skin button.png")
    slime_and_umbrella = love.graphics.newImage("slime-and-umbrella.png")    
    froggy2 = love.graphics.newImage("froggy 2.0.png")
    froggyshild = love.graphics.newImage("froggy shield.png")
    plane = love.graphics.newImage("plane.png")
    slime = love.graphics.newImage("slime.png")
    anvil = love.graphics.newImage("anvil.png")
end
function love.draw()
    if start == 1 then 
        love.graphics.draw(player, 300, y)
        love.graphics.draw(floor, x, 0)
        love.graphics.draw(floor, x+800, 0)
        love.graphics.draw(spike, xSpike+x, 500-2)
    end
    if start == 0 then
        love.graphics.draw(startbaton, 350, 200)
        love.graphics.draw(skinbaton, 350, 300)
        --love.graphics.draw(, x+800, 0)
    end
    if skin == 1 then start = 3
        love.graphics.draw(slime_and_umbrella, 350, 100)
        love.graphics.draw(slime, 350, 150)
        love.graphics.draw(plane, 350, 200)
        love.graphics.draw(froggy2, 350, 250)
        love.graphics.draw(froggyshild, 350, 300)
        love.graphics.draw(froggy, 350, 350)
        love.graphics.draw(anvil, 350, 400)

    end
end
function love.update()
    x=x-speed
    start=start
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
    if playerSkin == "slime-and-umbrella" then  jumpKauntersave = 2  fallspeed = 0.4
    if playerSkin == "bird" then  jumpKauntersave = 10  fallspeed = 1 end end
    if xSpike + x >290 and xSpike + x <310 and y >480 and y <500 then start = 0 speed =0 end
end
function love.keypressed(key, scancode, isrepeat)
   if jumpKaunter > 0 then 
        if key == "space" then
            y=y-jump
            jumpKaunter=jumpKaunter-1 
        
        end
    end
    if key == "f" then love.window.setFullscreen(true) end    
    if key == "tab" then start = 0 end
    if key == "escape" then love.window.close() end
    if key == "s" then  start = 0  skin = 0 end
end
function love.mousepressed(x,y, button, istouch)
   if y  >150 and y <250 and x  >300 and x <400 then start = 1 skin = 0 end
   if y  >250 and y <350 and x  >300 and x <400 then skin = 1  start = 3 end
end
