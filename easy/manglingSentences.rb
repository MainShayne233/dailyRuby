inputSentences = ["Eye of Newt, and Toe of Frog, Wool of Bat, and Tongue of Dog.",
				 "Adder's fork, and Blind-worm's sting, Lizard's leg, and Howlet's wing.",
				 "For a charm of powerful trouble, like a hell-broth boil and bubble."]
def sentenceSplitByWord(sentence)
	return sentence.split
end
def wordSplitByLetter(word)
	return word.split(//)
end
def isCapitalized?(word)
	if word[0].ord > 64 && word[0].ord < 91
		return true
	else
		return false
	end
end
def isLetter?(char)
	if char.ord < 65 || char.ord > 122
		return false
	else
		return true
	end
end
def sortsDeletesNonChars(word)
	return word.downcase.split(//).sort.delete_if {|char| !isLetter?(char)}
end
def wordMangler(word)
	mangledWord = Array.new
	capitlized = 0
	for char in 0..word.length-1
		if !isLetter?(word[char])
			mangledWord[char] = word[char]
		else
			if isCapitalized?(word[char])
				capitlized = 1
			end
			mangledWord[char] = []
		end
	end
	sortedWord = sortsDeletesNonChars(word)
	index = 0
	until mangledWord.count([]) == 0
		if mangledWord[index] == []
			mangledWord[index] = sortedWord[0]
			sortedWord.shift
		end
		index += 1
	end
	if capitlized == 1
		mangledWord[0].upcase!
	end
	return mangledWord.join
end
def sentenceMangler(sentence)
	splitSentence = sentenceSplitByWord(sentence).map {|word| wordMangler(word)}
	return splitSentence.join(" ")
end
for sentence in inputSentences
	puts sentenceMangler(sentence)
end