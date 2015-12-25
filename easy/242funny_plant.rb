def funny_plant(people, fruit)
	garden = Array.new()
	fruit.times do
		garden.push(0)
	end
	until garden.reduce(:+) >= people
		garden.map!{|i| i+= 1}
		garden.reduce(:+).times do
			garden.push(0)
		end
	end
	return garden[0] + 1
end