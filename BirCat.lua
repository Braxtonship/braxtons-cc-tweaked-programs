local args = {...}

if #args == 0 then
  print("not enough arguments... (try using -h for help)")
elseif #args > 1 then
  print("too many arguments... (try using -h for help)")
end

if args[1] == "-h" or args[1] == "--help" then
  print('"because cat..."')
  print("BirCat is a simple program based on the linux cat program")
  print("no version information will be given... just update from bacpax if needed")
  print("----------------")
  print("usage and commands")
  print("bircat <FILENAMEHERE>")
  print("bircat -h")
  print("bircat --help")
elseif #args == 1 then
  local path = args[1]
  if fs.exists(path) then
    if fs.isDir(path) then
      print("specified is a directory!")
    else
      fs.open(path, "r")
      
    end
  else
    print("could not find that file...")
  end
end
