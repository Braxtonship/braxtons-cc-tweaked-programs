--note. you do not actually need basalt to run the program. but its recommended.

--setup
local args = {...}
local version = "V0.5 INDEV testing"
local brString = ("-----------------------------------------------------------")
local enviroments = {"phoenix", "level-os", "opus-os"} --cloveros is planned. dont worry
--main code
if #args == 0 then
--basalt initialization
local basalt = require("basalt")
--start of code
local mainFrame = basalt.createFrame()
mainFrame:setBackground(colours.green)

local mainLabel = mainFrame:addLabel()
mainLabel:setText("birDES")
mainLabel:setBackground(colours.green)
mainLabel:setFontSize(2)
mainLabel:setPosition((term.getSize()-mainLabel:getSize())/2, 2)
mainLabel:setTextAlign("center")

local mainLabel2 = mainFrame:addLabel()
mainLabel2:setText("// bir Desktop Environment Selector //")
mainLabel2:setPosition((term.getSize()-mainLabel2:getSize())/2, 5)

local mainLabel3 = mainFrame:addLabel()
mainLabel3:setText(version)
mainLabel3:setPosition(1, 1)

local br1 = mainFrame:addLabel()
br1:setPosition(1, 6)
br1:setText(brString)

local button1install = mainFrame:addButton()
button1install:setText("phoenix")
button1install:setPosition(1,7)

--end of code
basalt.autoUpdate()
elseif args[1]:lower() == "-v" then
  print("birDES is currently updated up to: ", version)
elseif args[1]:lower() == "help" then
  print('type just "birdes" (if you have basalt installed). or try -v for version info')
  print('"--install [desktop environment here]" (WIP)')
else
  print("syntax error.")
end
