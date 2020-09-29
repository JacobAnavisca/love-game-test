local menuengine = require "lib.menuengine"
menuengine.stop_on_nil_functions = true

local text = "Nothing was selected."

-- Mainmenu
local mainmenu

-- Start Game
local function start_game()
  log.info("Start Game was selected!")
  text = "Start Game was selected!"
end

-- Options
local function options()
  log.info("Options was selected!")
  text = "Options was selected!"
end

-- Quit Game
local function quit_game()
  log.info("Quit Game was selected!")
  text = "Quit Game was selected!"
end

-- ----------

function love.load()
  log = require "lib.log"
  love.window.setMode(600, 400)
  love.graphics.setFont(love.graphics.newFont(20))

  mainmenu = menuengine.new(200, 100)
  mainmenu:addEntry("Start Game", start_game)
  mainmenu:addEntry("Options", options)
  mainmenu:addSep()
  mainmenu:addEntry("Quit Game", quit_game)
end

function love.update(dt)
  mainmenu:update()
end

function love.draw()
  love.graphics.clear()
  love.graphics.print(text)
  mainmenu:draw()
end

function love.keypressed(key, scancode, isrepeat)
  menuengine.keypressed(scancode)

  if scancode == "escape" then
    love.event.quit()
  end
end

function love.mousemoved(x, y, dx, dy, istouch)
  menuengine.mousemoved(x, y)
end
