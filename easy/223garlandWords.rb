def garland(word)
	biggestDegree = 0
	for degree in 0..word.length/2
		biggestDegree = degree+1 if word[0..degree] == word[word.length-1-degree..word.length-1] 
	end
	return biggestDegree
end

def garlandPrinter(word)
	if garland(word) > 0
		5.times do
			print word[0..word.length-1-garland(word)]
		end
		return word[0..garland(word)-word.length%2]
	else
		return "Not a garland word"
	end
end

def largestGarland(file)
	enable1Words = File.readlines(file)
	winningData = {"winningWord" => "word", "winningDegree" => 0}
	for word in enable1Words
		word.chomp!
		if garland(word) >= winningData["winningDegree"]
			winningData = {"winningWord" => word, "winningDegree" => garland(word)}
		end
	end
	return winningData
end

