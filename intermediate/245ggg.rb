input = File.readlines('input.txt')

input.map!{ |i| i.split(//)}

key = Array.new()

step = 0

for c in input[0]
	if c == " "
		step = (step+1)%2
		next
	elsif c == "\n"
		break
	end
	if step == 0
		key.push([c,""])
	else
		key.last[1] += c
	end
end

output = Array.new()

str = ""

for g in input[1]
	if g.ord != 71 && g.ord != 103
		output.push(g)
		next
	end
	str += g
	for c in key
		if str == c[1]
			output.push(c[0])
			str = ""
		end
	end
end

puts output.join
