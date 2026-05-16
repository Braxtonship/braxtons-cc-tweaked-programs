--vars
local args = { ... }
local version = "TESTING BUILD 0.0.1"
local packages = {
    "NO CURRENT PACKAGES"
}
local helpCommands = {
    "install <package of choice> (add -y to auto confirm)",
    "--packages <search (WIP)> or (-p)",
    "--version (or -v)"
}

-- main code

if #args == 0 then
    print("provide arguments...")
    print('use "bac --help (or -h)" for list of commands')
return
end

if args[1] == "--help" or args[1] == "-h" then
    for i = 1, #helpCommands do
        print(helpCommands[i])
    end
end

if args[1] == "--version" or args[1] == "-v" then
    print("BAC - package manager")
    print("---------------------")
    print("BAC package manager is a package manager for cc:tweaked. it is simular to the linux APT package manager.")
    print("version: ", version)
end

--main code (packages section)

