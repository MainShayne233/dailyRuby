words = File.readlines("enable1.txt").map! {|w| w.gsub("\r\n", "")}
letWords = Array.new()
for w in words; letWords.push(w) if w.length == 5; end

srand 3
randNums = Array.new(); 6.times do; randNums.push((rand*10000%letWords.length-1).to_i); end
for r in randNums
	puts letWords[r]
end

