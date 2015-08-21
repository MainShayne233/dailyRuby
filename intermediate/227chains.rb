input = File.readlines('chains.txt')
layout = input[1..input[0][0].to_i].map{|l| l.chomp("\n").split(//)}
chains = 0
for line in 0..input[0][0].to_i-1
	for link in 0..(input[0][2].to_i-1)
		if layout[line][link] == "x"
			layout[line][link] = layout[line][link-1] if layout[line][link-1].is_a? Integer
			layout[line][link] = layout[line-1][link] if layout[line-1][link].is_a? Integer
			if !(layout[line][link].is_a? Integer)
				chains+=1
				layout[line][link] = chains
			end
		end
	end
end

compare1 = Array.new(layout)
comapre2 = Array.new
value = Array.new
until compare1 == comapre2
	(input[0][0].to_i-1).step(0,-1) do |line|
		(input[0][2].to_i-1).step(0,-1) do |link|
			value = [layout[line][link-1],layout[line][link+1],layout[line-1][link],layout[line+1][link]].sort[0]
			layout[line][link] = value
		end
	end
	compare1=compare2
end