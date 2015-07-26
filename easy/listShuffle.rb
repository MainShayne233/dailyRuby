def arrayShuffle(array)
	randomIndex = Random.new

	shuffledArray = Array.new(array.count)
	for element in array
		while true
			randomElement = randomIndex.rand(0..array.count-1)
			if shuffledArray[randomElement] == nil
				shuffledArray[randomElement] = element
				break
			end
		end
	end
	return shuffledArray
end

input1 = "apple blackberry cherry dragonfruit grapefruit 
				kumquat mango nectarine persimmon raspberry raspberry"
input2 = "a e i o u"
inputArray = [input1,input2]

for each in inputArray
	puts ""
	puts arrayShuffle(each.split).join(" ")
	puts ""
end
