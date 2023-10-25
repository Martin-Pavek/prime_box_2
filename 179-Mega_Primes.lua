
--file_name_input = "179-Mega_Primes.txt"
file_name_input = "/home/pi/dokumenty/zaloha/179-Mega_Primes.txt"
file_name_input = "R:\a.txt"

file_input = io.open(file_name_input, "r")
if not file_input then
print("neexistuje soubor "..file_name_input)
print("konec")
os.execute("sleep 3")
os.exit()
end
print("nacitam soubor provocisel "..file_name_input)
os.execute("sleep 3")


file_output_name = "/home/pi/r/output.txt"
print("vystup ukladam do "..file_output_name)
os.execute("sleep 3")

file_output = io.open(file_output_name, "w")

file_output:write("0")
file_output:write("\n")
file_output:write("0")
file_output:write("\n")

pr2 = tonumber (file_input:read())


-- tady menit pocet nactenejch radku

max_lines = 664579 -- prvnich 10 milionu prvocisel ze souboru 179-Mega.txt 
--max_lines = 216815 -- do 3mega

--

for bb = 1,max_lines do -- menit max

pr1=pr2
pr2 = tonumber (file_input:read())

for aa = pr1,pr2-1 do
if (aa == pr1 or aa == pr2 )
then
--print(aa)
file_output:write(aa)
file_output:write("\n")
else
--print("0")
file_output:write("0")
file_output:write("\n")
end -- if


end -- aa
end -- bb

file_input:close()

print("posledni prvocislo nactene ze souboru 179-Mega_Primes.txt bylo "..pr1)

