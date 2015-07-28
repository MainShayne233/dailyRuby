def charValue(char)
	return char.ord-64
end

def wordBalance(word)
	balanceOptions = Array.new
	for balanceLetter in 1..word.length-2
		leftSide = 0
		rightSide = 0
		for leftLetter in 0..balanceLetter-1
			leftSide += charValue(word[leftLetter]) * (balanceLetter - leftLetter)
		end
		for rightLetter in balanceLetter+1..word.length-1
			rightSide += charValue(word[rightLetter]) * (rightLetter - balanceLetter)
		end
		if leftSide == rightSide
			balanceOptions.push("#{word[0..balanceLetter-1]} #{word[balanceLetter]} #{word[balanceLetter+1..word.length-1]} - #{leftSide}")
		end
	end
	return "#{word} DOES NOT BALANCE" if balanceOptions == []
	return balanceOptions
end

puts wordBalance("SORROW")