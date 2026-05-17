-- == extra setup == --

if not fs.exists("dirBacpax") then
    print("bacpax directory not found...")
    print("creating directory(s)...")
    fs.makeDir("dirBacpax")
    fs.makeDir("dirBacpax/cfg")
    print("made directory!")
    print("-----------------------")
end

--old version replacer
if not fs.exists("dirBacpax/cfg/keepOldBacpax.lua") then
    if fs.exists("bac") then
        print("quickClean:")
        print("found old version of BACPAX.")
        print("the BACPAX manager has had a name change and is no longer 'BAC', meaning that the original version is out of date. you can remove it or keep it.")
        print("would you like to remove: Y. or keep it: N. (keeping the old package will not remove the new one.)")
        print("[Y/N]?")
        local input = read()
        if input == "y" then
            print("-----------------------")
            print("removing old version of BACPAX")
            shell.run("rm", "bac")
            shell.run("rm", "bac.lua")
            print("bac was successfully removed!")
            print("returning to main script...")
            print("-----------------------")
        elseif input == "n" then
            print("-----------------------")
            print("you have chosen to keep old BACPAX")
            print("updating config")
            local file = fs.open("dirBacpax/cfg/keepOldBacpax.lua", "w")
            if file then
                file.write("True")
                file.close()
                print("success!")
            else
                term.setTextColour(colours.red)
                print("BACPAX: COULD NOT WRITE NEW FILE!")
                term.setTextColour(colours.white)
            end
            print("returning to main script...")
            print("-----------------------")
        else
            print("-----------------------")
            term.setTextColour(colour.red)
            print("please input either 'y' or 'n', or use lowercase.")
            term.setTextColour(colour.white)
            os.sleep(2)
            print("returning to main script...")
            print("-----------------------")
        end
    end
end

-- == vars == --
local args = { ... }
local version = "TESTING BUILD v0.15"
local packages = {
    "birfetch",
    "googol",
    "password-program",
    "far",
    "filex",
    "virtualos-cmd",
    "virtualos-gui"
}

local helpCommands = {
    "install <package of choice> (add -y to auto confirm)",
    "update (will get the newest version of BACPAX Package Manager)",
    "--packages <search (WIP)> or (-l)",
    "--version (or -v)"
}

-- == main code == --

--argument detection

if #args == 0 then
    print("provide arguments...")
    print('use "bacpax --help (or -h)" for list of commands')
return
end

--help

if args[1] == "--help" or args[1] == "-h" then
    for i = 1, #helpCommands do
        print(helpCommands[i])
    end
end

--version

if args[1] == "--version" or args[1] == "-v" then
    if args[2] == "getVerScript" then
        term.setTextColour(colours.green)
        print("updated to latest version: ", version)
        term.setTextColour(colours.white)
    else
        term.clear()
        print("BACPAX - package manager")
        print("---------------------")
        term.setTextColour(colours.red)
        print("BACPAX is a package manager for cc:tweaked, simular to the linux APT package manager.")
        term.setTextColour(colours.green)
        print("version: ", version)
    end
end

--package lookup

if args[1] == "--packages" or args[1] == "-l" then
    print("listing all packages...")
    print("reminder: packages are case sensitive!")
    print("-----------------------")
    for i = 1, #packages do
        print(packages[i])
    end
end

--update

if args[1] == "update" or args[1] == "reinstall" or args[1] == "-u" then
    if args[2] == "-y" then
        term.clear()
        print("update BACPAX package manager")
        print("---------------------------")
        print("updating BACPAX...")
        shell.run("rm", "bacpax")
        term.setTextColour(colours.yellow)
        shell.run("wget", "https://raw.githubusercontent.com/Braxtonship/braxtons-cc-tweaked-programs/refs/heads/main/BACPAX-PM.lua", "bacpax")
        term.setTextColour(colours.white)
        print("finished!")
        shell.run("bacpax", "-v", "getVerScript")
    else
        term.clear()
        print("update BACPAX package manager")
        print("---------------------------")
        print("are you sure you want to update BACPAX package manager?")
        print("(Y/N)")
        local input = read()
        if input == "y" then
            print("updating...")
            shell.run("rm", "bacpax")
            term.setTextColour(colours.yellow)
            shell.run("wget", "https://raw.githubusercontent.com/Braxtonship/braxtons-cc-tweaked-programs/refs/heads/main/BACPAX-PM.lua", "bacpax")
            term.setTextColour(colours.white)
            print("finished!")
            term.setTextColour(colours.green)
            print("updated to latest version: ", version)
            term.setTextColour(colours.white)
        else
            print("aborting update...")
            return
        end
    end
end
        
-- == main code (packages section) == --

local function installPackage()
    -- by me
    if args[2] == "birfetch" then
        if args[3] == "-y" then
            print("selected package birfetch")
            print("---------------------------")
            print("installing birfetch...")
            print("---------------------------")
            term.setTextColour(colours.yellow)
            shell.run("wget", "https://raw.githubusercontent.com/Braxtonship/braxtons-cc-tweaked-programs/refs/heads/main/birfetch.lua", "birfetch.lua")
            term.setTextColour(colours.white)
            print("finished!")
            return
        else
            print("selected package birfetch")
            print("---------------------------")
            print("are you sure you want to install birfetch?")
            print("---------------------------")
            print("(Y/N)")
            local input = read()
            if input == "y" then
                print("installing...")
                term.setTextColour(colours.yellow)
                shell.run("wget", "https://raw.githubusercontent.com/Braxtonship/braxtons-cc-tweaked-programs/refs/heads/main/birfetch.lua", "birfetch.lua")
                term.setTextColour(colours.white)
                print("finished!")
                return
            else
                print("aborting installation...")
                return
            end
        end
    end
    -- not by me
    if args[2] == "googol" then
        if args[3] == "-y" then
            print("selected package googol")
            print("---------------------------")
            print("installing googol...")
            print("------------------------")
            term.setTextColour(colours.yellow)
            shell.run("pastebin", "get", "EmssRF7b", "googol")
            term.setTextColour(colours.white)
            print("finished!")
            return
        else
            print("selected package googol")
            print("---------------------------")
            print("are you sure you want to install googol?")
            print("---------------------------")
            print("(Y/N)")
            local input = read()
            if input == "y" then
                print("installing...")
                print("---------------------------")
                term.setTextColour(colours.yellow)
                shell.run("pastebin", "get", "EmssRF7b", "googol")
                term.setTextColour(colours.white)
                print("finished!")
                return
            else
                print("aborting installation...")
                return
            end
        end
    end
    if args[2] == "password-program" then
        if args[3] == "-y" then
            print("selected package password-program")
            print("---------------------------")
            print("installing password-program (with dependencies)")
            print("dependencies:")
            term.setTextColour(colours.green)
            print("password-program-startup")
            term.setTextColour(colours.white)
            print("---------------------------")
            term.setTextColour(colours.yellow)
            shell.run("pastebin", "get", "8tQ1vyhh", "lockunlock")
            shell.run("pastebin", "get", "uUSrzyyx", "startup")
            term.setTextColour(colours.white)
            print("finished!")
            return
        else
            print("selected package password-program")
            print("---------------------------")
            print("are you sure you want to install password-program and its dependencies?")
            print("dependencies:")
            term.setTextColour(colours.green)
            print("password-program-startup")
            term.setTextColour(colours.white)
            print("---------------------------")
            print("(Y/N)")
            local input = read()
            if input == "y" then
                print("installing...")
                term.setTextColour(colours.yellow)
                shell.run("pastebin", "get", "8tQ1vyhh", "lockunlock")
                shell.run("pastebin", "get", "uUSrzyyx", "startup")
                term.setTextColour(colours.white)
                print("finished!")
                return
            else
                print("aborting installation...")
                return
            end
        end
    end
    if args[2] == "far" then
        if args[3] == "-y" then
            print("selected package far")
            print("---------------------------")
            print("installing far...")
            print("------------------------")
            term.setTextColour(colours.yellow)
            shell.run("wget", "https://raw.githubusercontent.com/InternetUnexplorer/CCJam-2016/master/far", "far")
            term.setTextColour(colours.white)
            print("finished!")
            return
        else
            print("selected package far")
            print("---------------------------")
            print("are you sure you want to install far?")
            print("---------------------------")
            print("(Y/N)")
            local input = read()
            if input == "y" then
                print("installing...")
                print("---------------------------")
                term.setTextColour(colours.yellow)
                shell.run("wget", "https://raw.githubusercontent.com/InternetUnexplorer/CCJam-2016/master/far", "far")
                term.setTextColour(colours.white)
                print("finished!")
                return
            else
                print("aborting installation...")
                return
            end
        end
    end
    if args[2] == "filex" then
        if args[3] == "-y" then
            print("selected package FileX")
            print("---------------------------")
            print("installing FileX...")
            print("------------------------")
            term.setTextColour(colours.yellow)
            shell.run("pastebin", "run", "AVqAFH8h")
            term.setTextColour(colours.white)
            print("finished!")
            return
        else
            print("selected package FileX")
            print("---------------------------")
            print("are you sure you want to install FileX?")
            print("---------------------------")
            print("(Y/N)")
            local input = read()
            if input == "y" then
                print("installing...")
                print("---------------------------")
                term.setTextColour(colours.yellow)
                shell.run("pastebin", "run", "AVqAFH8h")
                term.setTextColour(colours.white)
                print("finished!")
                return
            else
                print("aborting installation...")
                return
            end
        end
    end
    if args[2] == "virtualos-cmd" then
        if args[3] == "-y" then
            print("selected package virtualOS terminal edition")
            print("---------------------------")
            print("installing virtualOS terminal edition...")
            print("------------------------")
            term.setTextColour(colours.yellow)
            shell.run("wget", "https://gitlab.com/Wilma456/Computercraft/raw/master/Programs/virtualos.lua", "virtualos")
            term.setTextColour(colours.white)
            print("finished!")
            return
        else
            print("selected package virtualOS terminal edition")
            print("---------------------------")
            print("are you sure you want to virtualOS terminal edition?")
            print("---------------------------")
            print("(Y/N)")
            local input = read()
            if input == "y" then
                print("installing...")
                print("---------------------------")
                term.setTextColour(colours.yellow)
                shell.run("wget", "https://gitlab.com/Wilma456/Computercraft/raw/master/Programs/virtualos.lua", "virtualos")
                term.setTextColour(colours.white)
                print("finished!")
                return
            else
                print("aborting installation...")
                return
            end
        end
    end
    if args[2] == "virtualos-gui" then
        if args[3] == "-y" then
            print("selected virtualOS gui edition")
            print("---------------------------")
            print("installing virtualOS gui edition (with dependencies)")
            print("dependencies:")
            term.setTextColour(colours.green)
            print("virtualOS terminal edition")
            term.setTextColour(colours.white)
            print("---------------------------")
            term.setTextColour(colours.yellow)
            shell.run("pastebin", "run", "B05YGPPy")
            shell.run("wget", "https://gitlab.com/Wilma456/Computercraft/raw/master/Programs/virtualos.lua", "virtualos")
            term.setTextColour(colours.white)
            print("finished!")
            return
        else
            print("selected package virtualOS gui edition")
            print("---------------------------")
            print("are you sure you want to install virtualOS gui edition and its dependencies?")
            print("dependencies:")
            term.setTextColour(colours.green)
            print("virtualOS terminal edition")
            term.setTextColour(colours.white)
            print("---------------------------")
            print("(Y/N)")
            local input = read()
            if input == "y" then
                print("installing...")
                term.setTextColour(colours.yellow)
                shell.run("pastebin", "run", "B05YGPPy")
                shell.run("wget", "https://gitlab.com/Wilma456/Computercraft/raw/master/Programs/virtualos.lua", "virtualos")
                term.setTextColour(colours.white)
                print("finished!")
                return
            else
                print("aborting installation...")
                return
            end
        end
    end
end

--install statment

if args[1] == "install" then
    if args[2] == "" then
        print("please provide a package")
    end
    for i = 1, #packages do
        if  packages[i] == args[2] then
            installPackage() --install the package
            return
        else
            print('the package: "',args[2],'" could not be found.')
            print("did you type it correctly? (use -l or --packages)")
            return
        end
    end
end
