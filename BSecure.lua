local args = {...}
local version = "0.1 INDEV TESTING"
local commands = {"--help", "--install"}

-- no args given
if #args == 0 then
  print("expected arguments.")
  print("use --help for more information")
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
    local input = io.read("")
    print("re enter password")
    local input2 = io.read("")
    if input == input2 then
      print("inputs match")
      os.sleep(0.5)
      print("continuing with install")
    else
      print("inputs dont match")
      os.sleep(1)
      shell.run("bsecure --install")
    end
  end
end
