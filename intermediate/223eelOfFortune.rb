def snodChecker(secretWord, offensiveWord)
	gameBoardArray = Array.new
	for offensiveIndex in 0..offensiveWord.length-1
		for secretIndex in 0..secretWord.length-1
			if secretWord[secretIndex] == offensiveWord[offensiveIndex]
				gameBoardArray[secretIndex] = secretWord[secretIndex]
			end
		end
	end
	return true if gameBoardArray.join == offensiveWord
	return false
end

puts snodChecker("synchronized", "snond")
puts snodChecker("misfunctioned", "snond")
puts snodChecker("mispronounced", "snond")
puts snodChecker("shotgunned", "snond")
puts snodChecker("snond", "snond")
