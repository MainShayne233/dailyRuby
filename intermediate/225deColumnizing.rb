#NOT DONE

input = File.readlines('deColumnizingInput1.txt').join.split

harvestedWords = input.delete_if { |word| word.split(//).count('+') > 0}
pipeLocationArray = Array.new


preservedInput = File.readlines('deColumnizingInput1.txt').to_s.split(//).join




for word in 0..harvestedWords.count-1
	pipeLocationArray.push(word) if harvestedWords[word] == "|"
end

while pipeLocationArray.count > 0
	for index in pipeLocationArray[0]..pipeLocationArray[1]
		harvestedWords[index] = nil
	end
	pipeLocationArray.slice!(0..1)
end

harvestedWords.compact!




hyphenLocationArray = Array.new
for index in 0..harvestedWords.count-1
	word = harvestedWords[index]
	hyphenLocationArray.push(index) if word.split(//).count('-') > 0 && word.split(//).count > 1
end



while hyphenLocationArray.count > 0
	harvestedWords[hyphenLocationArray[0]].delete! "-"
	harvestedWords[hyphenLocationArray[0]] += harvestedWords[hyphenLocationArray[0]+1]
	harvestedWords[hyphenLocationArray[0]+1] = nil
	hyphenLocationArray.shift
end
harvestedWords.compact!

puts harvestedWords.join(" ")