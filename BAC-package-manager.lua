-- == vars == --
local args = { ... }
local version = "TESTING BUILD 0.0.5"
local packages = {
    "birfetch",
    "googol",
    "password-program"
}

local helpCommands = {
    "install <package of choice> (add -y to auto confirm)",
    "update (will get the newest version of BAC package manager)",
    "--packages <search (WIP)> or (-l)",
    "--version (or -v)"
}

-- == main code == --

--argument detection

if #args == 0 then
    print("provide arguments...")
    print('use "bac --help (or -h)" for list of commands')
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
    term.clear()
    print("BAC - package manager")
    print("---------------------")
    term.setTextColour(colours.red)
    print("BAC package manager is a package manager for cc:tweaked, simular to the linux APT package manager.")
    term.setTextColour(colours.green)
    print("version: ", version)
end

--package lookup

if args[1] == "--packages" or args[1] == "-l" then
    print("listing all packages...")
    print("-----------------------")
    for i = 1, #packages do
        print(packages[i])
    end
end

--update

if args[1] == "update" or args[1] == "reinstall" then
    if args[2] == "-y" then
        print("update BAC package manager")
        print("---------------------------")
        print("updating BAC package manager...")
        shell.run("rm", "bac")
        term.setTextColour(colours.yellow)
        shell.run("wget", "https://raw.githubusercontent.com/Braxtonship/braxtons-cc-tweaked-programs/refs/heads/main/BAC-package-manager.lua", "bac")
        term.setTextColour(colours.white)
        print("finished!")
        term.setTextColour(colours.green)
        print("updated to latest version: ", version)
        term.setTextColour(colours.white)
    else
        print("update BAC package manager")
        print("---------------------------")
        print("are you sure you want to update BAC package manager?")
        print("(Y/N)")
        local input = read()
        if input == "y" then
            print("updating...")
            shell.run("rm", "bac")
            term.setTextColour(colours.yellow)
            shell.run("wget", "https://raw.githubusercontent.com/Braxtonship/braxtons-cc-tweaked-programs/refs/heads/main/BAC-package-manager.lua", "bac")
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
            print("installing password-program")
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
end

--install statment

if args[1] == "install" then
    if args[2] == "" then
        print("please provide a package")
    end
    for i = 1, #packages do
        if  packages[i] == args[2] then
            installPackage() --install the package
        else
            print('the package: "', args[2], '" could not be found.')
        end
    end
end
