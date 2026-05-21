-- install this on a floppy disk only
term.clear()
print("Would you like to install BAC package manager?")
term.setTextColour(colours.red)
print("Y/N")
term.setTextColour(colours.white)
local args = { ... }
if args[1] == "-y" then
    print("installing...")
    term.setTextColour(colours.yellow)
    shell.run("wget", "https://raw.githubusercontent.com/Braxtonship/braxtons-cc-tweaked-programs/refs/heads/main/BACPAX-PM.lua", "bacpax")
    term.setTextColour(colours.green)
    print("installation complete!")
    term.setTextColour(colours.pink)
    print("ejecting disk(s)...")
    term.setTextColour(colours.white)
    disk.eject("top")
    disk.eject("bottom")
    disk.eject("left")
    disk.eject("right")
    disk.eject("front")
    disk.eject("back")
elseif args[1] == "-s"
    print("installing...")
    term.setTextColour(colours.yellow)
    shell.run("wget", "https://raw.githubusercontent.com/Braxtonship/braxtons-cc-tweaked-programs/refs/heads/main/BACPAX-PM.lua", "bacpax")
    term.setTextColour(colours.green)
    print("installation complete!")
else
    local input = read()
    if input == "y" then
        print("installing...")
        term.setTextColour(colours.yellow)
        shell.run("wget", "https://raw.githubusercontent.com/Braxtonship/braxtons-cc-tweaked-programs/refs/heads/main/BACPAX-PM.lua", "bacpax")
        term.setTextColour(colours.green)
        print("installation complete!")
        term.setTextColour(colours.pink)
        print("ejecting disk(s)...")
        term.setTextColour(colours.white)
        disk.eject("top")
        disk.eject("bottom")
        disk.eject("left")
        disk.eject("right")
        disk.eject("front")
        disk.eject("back")
    else
        print("installation aborted...")
    end
end
