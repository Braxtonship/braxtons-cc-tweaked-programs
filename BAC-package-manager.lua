-- == vars == --
local args = { ... }
local version = "TESTING BUILD 0.0.1"
local packages = {
    "bir0fetch"
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
    print("BAC - package manager")
    print("---------------------")
    print("BAC package manager is a package manager for cc:tweaked, simular to the linux APT package manager.")
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
        shell.run("rm", "bac.lua")
        shell.run("wget", "https://raw.githubusercontent.com/Braxtonship/braxtons-cc-tweaked-programs/refs/heads/main/BAC-package-manager.lua", "bac.lua")
        print("finished!")
    else
        print("update BAC package manager")
        print("---------------------------")
        print("are you sure you want to update BAC package manager?")
        print("(Y/N)")
        local input = read()
        if input == "y" then
            print("updating...")
            shell.run("rm", "bac.lua")
            shell.run("wget", "https://raw.githubusercontent.com/Braxtonship/braxtons-cc-tweaked-programs/refs/heads/main/BAC-package-manager.lua", "bac.lua")
            print("finished!")
        else
            print("aborting update...")
            return
        end
    end
end
        
-- == main code (packages section) == --

local function installPackage()
    if args[2] == "bir0fetch" then
        if args[3] == "-y" then
            print("selected package bir0fetch")
            print("---------------------------")
            print("installing bir0fetch...")
            shell.run("wget", "https://raw.githubusercontent.com/Braxtonship/braxtons-cc-tweaked-programs/refs/heads/main/bir0fetch.lua", "bir0fetch.lua")
            print("finished!")
        else
            print("selected package bir0fetch")
            print("---------------------------")
            print("are you sure you want to install bir0fetch?")
            print("(Y/N)")
            local input = read()
            if input == "y" then
                print("installing...")
                shell.run("wget", "https://raw.githubusercontent.com/Braxtonship/braxtons-cc-tweaked-programs/refs/heads/main/bir0fetch.lua", "bir0fetch.lua")
                print("finished!")
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
