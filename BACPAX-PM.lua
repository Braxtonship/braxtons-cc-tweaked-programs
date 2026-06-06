-- == extra setup == --

if not fs.exists(".BacpaxDir") then
    if fs.exists("dirBacpax") then
        print("found old directory method.")
        print("replacing...")
        shell.run("rm dirBacpax")
        print("deleted...")
        print("-----------")
        print("making new...")
        fs.makeDir(".BacpaxDir")
        fs.makeDir(".BacpaxDir/cfg")
        print("Complete!")
    else
        print("bacpax directory not found...")
        print("creating directory(s)...")
        fs.makeDir(".BacpaxDir")
        fs.makeDir(".BacpaxDir/cfg")
        print("made directory!")
        print("-----------------------")
    end
end

--old version replacer
if not fs.exists(".BacpaxDir/cfg/keepOldBacpax.lua") then
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
            local file = fs.open(".BacpaxDir/cfg/keepOldBacpax.lua", "w")
            if file then
                file.write('print("hello. nothing to see here...")')
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
local version = "OFFICAL RELEASE v2.1 HOTFIX 1"
local packages = {
    {
        name = "birfetch",
        description = "a screen fetch like program.",
        method = "wget",
        value = "https://raw.githubusercontent.com/Braxtonship/braxtons-cc-tweaked-programs/refs/heads/main/birfetch.lua",
        filename = "birfetch.lua"
    },
    {
        name = "googol",
        description = "pretty self explainatory. its google kinda.",
        method = "pastebin",
        action = "get",
        value = "EmssRF7b",
        filename = "googol"
    },
    {
        name = "password-program",
        description = "for doors and stuff.",
        method = "pastebin",
        action = "get",
        value = "8tQ1vyhh",
        filename = "lockunlock",
        dependencies = {
            {
                method = "pastebin",
                action = "get",
                value = "uUSrzyyx",
                filename = "startup.lua",
                name = "startup"
            }
        }
    },
    {
        name = "far",
        description = "a remote access program.",
        method = "wget",
        value = "https://raw.githubusercontent.com/InternetUnexplorer/CCJam-2016/master/far",
        filename = "far"
    },
    {
        name = "filex",
        description = "a file explorer.",
        method = "pastebin",
        action = "run",
        value = "AVqAFH8h",
        filename = "FileX"
    },
    {
        name = "virtualos-cmd",
        description = "a virtual sandbox for computer craft stuff.",
        method = "wget",
        value = "https://gitlab.com/Wilma456/Computercraft/raw/master/Programs/virtualos.lua",
        filename = "virtualos"
    },
    {
        name = "virtualos-gui",
        description = "gui version of virtual OS.",
        method = "pastebin",
        action = "run",
        value = "B05YGPPy",
        filename = "virtualos-manager"
    },
    {
        name = "brainf-interpreter",
        description = "a brainf interpreter. dunno why you would want it but, its here",
        method = "pastebin",
        action = "get",
        value = "0AXaibqV",
        filename = "brainf"
    },
    {
        name = "ccbox",
        description = "another virtual machine",
        method = "pastebin",
        action = "get",
        value = "nrSC7JcH",
        filename = "ccbox"
    },
    {
        name = "birdes",
        description = "a desktop environment picker made by me. (actual environments probably not also its not finished. just blank file rn)",
        method = "wget",
        value = "https://raw.githubusercontent.com/Braxtonship/braxtons-cc-tweaked-programs/refs/heads/main/birDES.lua",
        filename = "birdes",
        dependencies = {
            {
                method = "wget",
                value = "run https://raw.githubusercontent.com/Pyroxenium/Basalt/refs/heads/master/docs/install.lua",
                filename = "release latest.lua",
                name = "basalt"
            }
        }
    },
    {
        name = "basalt",
        description = "a very cool GUI library",
        method = "wget",
        value = "run https://raw.githubusercontent.com/Pyroxenium/Basalt/refs/heads/master/docs/install.lua",
        filename = "release latest.lua"
    },
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
        print("BACPAX is a package manager for cc:tweaked, very lightly based on the linux APT package manager.")
        term.setTextColour(colours.green)
        print("version: ", version)
    end
end

--package lookup

if args[1] == "--packages" or args[1] == "-l" or args[1] == "--list" then
    print("listing all packages... (slow because scrolling is not yet implemented)")
    print("-----------------------")
    for i, p in ipairs(packages) do
        print(p.name)
        os.sleep(1)
        if p.description == "" then
            term.setTextColour(colours.yellow)
            print("=> ", "Description not avalible.")
            term.setTextColour(colours.white)
        else
            term.setTextColour(colours.yellow)
            print("=> ", p.description)
            term.setTextColour(colours.white)
        end
    end
end

--download methods

local function download(p)
    if p.method == 'wget' then
        shell.run("wget", p.value, p.filename)
    elseif p.method == 'pastebin' then
        if p.action == 'get' then
            shell.run("pastebin", "get", p.value, p.filename)
        elseif p.action == 'run' then
            shell.run("pastebin", "run", p.value)            
        else
            term.setTextColour(colours.red)
            print("Unknown pastebin action")
            return false
        end
    else
        term.setTextColour(colours.red)
        print("Unknown download method")
        return false
    end
    
    return true
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
        term.setTextColour(colours.yellow)
        shell.run('wget run "https://raw.githubusercontent.com/Braxtonship/braxtons-cc-tweaked-programs/refs/heads/main/BACPAX-PM.lua" -v getVerScript')
        term.setTextColour(colours.white)
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

local function installPackage(p)
    print("selected package ", p.name)
    print("---------------------------")
    if args[3] == "-y" then
        print("installing", p.name, "...", "and any dependencies")
        print("---------------------------")
        term.setTextColour(colours.yellow)
        if fs.exists(p.filename) then
            term.setTextColour(colours.white)
            print("found original file...")
            print("deleting and to replace with latest version...")
            term.setTextColour(colours.yellow)
            shell.run("rm", p.filename)
            term.setTextColour(colours.white)
            print("done deleting... reinstalling latest version")
            term.setTextColour(colours.yellow)
        end
        
        if download(p) == false then
            return
        end
        
        if p.dependencies then
            for i, d in ipairs(p.dependencies) do
                if download(d) == false then
                    return
                end
            end
        end

        term.setTextColour(colours.white)
        print("finished!")
    else
        if p.dependencies then
            print("are you sure you want to install ", p.name, " and its dependencies?")
            print("---------------------------")
            print("dependencies:")
            term.setTextColour(colours.yellow)
            for i, v in ipairs(p.dependencies) do
                print(v.name)
            end
            term.setTextColour(colours.white)
            print("---------------------------")
            print("(Y/N)")
        else
            print("are you sure you want to install ", p.name, "?")
            print("---------------------------")
            print("(Y/N)")
        end
        
        local input = read()
        if input == "y" then
            print("installing...")
        else
            print("aborting installation...")
            return
        end
        term.setTextColour(colours.yellow)
        if fs.exists(p.filename) then
            term.setTextColour(colours.white)
            print("found original file...")
            print("deleting and to replace with latest version...")
            term.setTextColour(colours.yellow)
            shell.run("rm", p.filename)
            term.setTextColour(colours.white)
            print("done deleting... reinstalling latest version")
            term.setTextColour(colours.yellow)
        end
        
        if download(p) == false then
            return
        end
        
        if p.dependencies then
            for i, d in ipairs(p.dependencies) do
                if download(d) == false then
                    return
                end
            end
        end

        term.setTextColour(colours.white)
        print("finished!")
    end
end

--install statment

if args[1] == "install" then
    if args[2] == "" then
        print("please provide a package")
    end

    for i, p in ipairs(packages) do
        if  p.name == args[2]:lower() then
            installPackage(p) --install the package
            return
        end
    end
    print('the package: "',args[2],'" could not be found.')
    print("did you type it correctly? (use -l or --packages)")
    return
end
