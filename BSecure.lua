local args = {...}
local version = "1.2 RELEASE"
local commands = {"--help", "--install", "--version"}

-- no args given
if #args == 0 then
  print("expected arguments.")
  print("use --help for more information")
end
--version stuff
if args[1] == "--version" then
  print('BSecure is updated to version: "' .. version .. '"')
end
--help command
if args[1] == "--help" then
  print("BSecure")
  print("commands and help stuff")
  print("=============")
  for i = 1, #commands do
    print(commands[i])
  end
  print("=============")
  print("if you havent already, use --install to properly install BSecure")
end
--install
if args[1] == "--install" then
  print("BSecure installation wizard")
  if fs.exists(".BSecure") then
    print("BSecure is already installed. (reinstall will be added later)")
  else
    print("enter a password for your terminal user: ")
    local input = read(" ")
    print("re enter password")
    local input2 = read(" ")
    if input == input2 then
      print("inputs match")
      os.sleep(0.5)
      print("continuing with install")
      print("=======================")
      print("making directory...")
      fs.makeDir(".bsecure")
      print("making password files")
      local passwordFile = fs.open(".bsecure/passwords", "w")
      passwordFile.write(input)
      passwordFile.close()
      print("editing startup file")
      local startupFile = fs.open("startup", "w")
      startupFile.write('shell.run("bsecure loginStartup")')
      startupFile.close()
      print("complete!")
    else
      print("inputs dont match")
      os.sleep(1)
      shell.run("bsecure --install")
    end
  end
end
--login handling
if args[1] == "loginStartup" then
  os.pullEvent = os.pullEventRaw
  term.clear()
  term.setCursorPos(1, 1)
  write("Login: ")
  term.setCursorPos(1, 7)
  local read = read("")
  local openFile = fs.open(".bsecure/passwords", "r")
  local line = openFile.readLine()
  if read == line then
    print("Welcome!")
  else
    print("incorrect password!")
    os.sleep(1)
    os.reboot()
  end
end
