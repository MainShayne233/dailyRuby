def FizzBuzz(a, b, c)
	s, v = ["a","b","c"], [a,b,c]
	for n in 1..100
		ts = ""
		for i in 0..2; ts = "#{ts}#{s[i]}" if n%v[i]==0; end
		print ts=="" ? ts : "#{ts}\n"
	end
end

FizzBuzz(2, 5, 4)
