#!/usr/bin/lua

-- prime-box verze 2 nacita prvocisla ze samostatneho souboru
-- a sazi je do rastru x,y ktery se da menit


--file_name_input = "3mega.txt"
file_name_input = "/home/pi/dokumenty/zaloha/10mega.txt"
--file_name_input = arg[1]

--xx = 255
--yy = 175

xx=arg[1]
yy=arg[2]


if #arg ~= 2 then
print(arg[0].." x y")
print(arg[0].." 255 175")
--print(#arg)
os.exit()
end


-- nazev souboru je zaroven posledni prvocislo v souboru aby vtom byl prehled
file_input = io.open(file_name_input, "r")
if not file_input then
print("neexistuje soubor "..file_name_input)
print("konec")
os.execute("sleep 1")
os.exit()
end

print("nacitam soubor provocisel "..file_name_input)
os.execute("sleep 3")

rozmer = xx.."x"..yy

file_output_name = "/home/pi/r/" .. rozmer .. "-v2.txt"
print(file_output_name)

file_output = io.open(file_output_name, "w")
file_output:write("# ImageMagick pixel enumeration: "..xx..","..yy..",65535,srgb")
file_output:write("\n")

-- 65535 = 16 bitova barevna hloubka (asi zbytecny v tomhle pripade)
file_output:write("0,0: (65535,65535,65535) #FFFFFF white")
file_output:write("\n")
file_output:write("1,0: (65535,65535,65535) #FFFFFF white")
file_output:write("\n")

n=1

for y = 1 , yy do
for x = 1 , xx do

prime_line = tonumber(file_input:read())


if (n >= 3 and prime_line ~= 0 ) then
--if ( prime_line ~= 0 ) then
--print((x-1)..","..(y-1)..": (0,0,0) #000000 black # prime = "..prime_line)
file_output:write((x-1)..","..(y-1)..": (0,0,0) #000000 black # prime = "..prime_line)
file_output:write("\n")
end


if (n >= 3 and prime_line == 0 ) then
--if ( prime_line == 0 ) then
--print((x-1)..","..(y-1)..": (65535,65535,65535)  #FFFFFF  white")
file_output:write((x-1)..","..(y-1)..": (65535,65535,65535)  #FFFFFF  white")
file_output:write("\n")
end


n=n+1

end
end -- y,x

file_input:close()
file_output:close()

c1= "convert " .. file_output_name .. " " .. string.sub(file_output_name,1,#file_output_name -3 ) .. "bmp"
print(c1)
os.execute(c1)

c2= "convert "..string.sub(file_output_name,1,#file_output_name -3 ).."bmp ".. string.sub(file_output_name,1,#file_output_name -3 ) .. "pdf"
-- prikaz convert umi jeste taky prevadet z txt do pdf a z bmp do pdf
--print(c2)
--os.execute(c2)

os.exit()


