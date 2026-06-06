--setup
local args = {...}
local version = "V0.1.1 TESTING"
local basalt = require("basalt")
local brString = ("-----------------------------------------------------------")
--main code
if #args == 0 then
local mainFrame = basalt.createFrame()
mainFrame:setBackground(colours.green)

local mainLabel = mainFrame:addLabel()
mainLabel:setText("birDES")
mainLabel:setBackground(colours.green)
mainLabel:setFontSize(2)
mainLabel:setPosition((term.getSize()-mainLabel:getSize())/2, 1)
mainLabel:setTextAlign("center")

local mainLabel2 = mainFrame:addLabel()
mainLabel2:setText("/bir Desktop Selector/")
mainLabel2:setPosition((term.getSize()-mainLabel2:getSize())/2, 4)

local mainLabel3 = mainFrame:addLabel()
mainLabel3:setText(version)
mainLabel3:setPosition(1, 1)

local br1 = mainFrame:addLabel()
br1:setPosition(1, 5)
br1:setText(brString)

local warning = mainFrame:addLabel()
warning:setFontSize(2)
warning:setText("STILL UNDER DEVELOPMENT... CHECK BACK LATER...")
warning:setPosition((term.getSize()-warning:getSize())/2, 7)

local warning2 = mainFrame:addLabel()
warning2:setFontSize(2)
warning2:setText(version)
warning2:setPosition((term.getSize()-warning2:getSize())/2, 7)
  
basalt.autoUpdate()
elseif args[1]:lower() == -v then
  print("birDES is currently updated up to: ", version)
end
