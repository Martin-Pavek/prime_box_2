
if arg[1] == nil then
print("lua " .. arg[0].." max")
print("lua " .. arg[0].." 10000")
os.execute("sleep 3")
os.exit()
end

max=arg[1]

file_name = "/home/pi/r/"..max..".txt"
print("zapisuju do ")
print(file_name)
os.execute("sleep 3")

file = io.open(file_name, "w")

file:write(0)
file:write("\n")
file:write(0)
file:write("\n")

for n = 3,max do
r=1
for i = 2,(n/2)  do

if (n % i == 0) then
r=0
end
end

if (r == 1 ) then
--print(n)
file:write(n)
file:write("\n")
else
--print("0")
file:write(0)
file:write("\n")
end

end -- n

file:close()
print("hotovo")

