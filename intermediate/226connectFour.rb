def dropper(move, board, player)
	column = move.downcase.ord-97
	row = 0
	until board[row][column] == "-"
		row += 1
	end
	board[row][column] = player
	return [row, column]
end

def winner?(move, board, player)
	# Horizontal
	row, column = move[0], move[1]
	for i in 0..3
		if board[row][(column-3+i)..(column+i)].join == "#{player}#{player}#{player}#{player}"
			return [[row,column-3+i],[row,column-2+i],[row,column-1+i],[row,column+i],player]
		end
	end

	# Vertical
	verticalCheck = board[row][column]
	for i in 1..3
		verticalCheck += board[row-i][column]
	end
	if verticalCheck == "#{player}#{player}#{player}#{player}"
		return [[row-3,column],[row-2,column],[row-1,column],[row,column],player]
	end

	#Diagnol Up Right
	for i in 0..3
		tempArray = Array.new
		returnArray = Array.new
		for j in 0..3
			tempArray.push(board[row-j+i][column-j+i])
			returnArray.push([row-j+i,column-j+i])
		end
		if tempArray.join == "#{player}#{player}#{player}#{player}"
			returnArray.reverse!
			returnArray.push(player)
			return returnArray
		end
	end

	#Diagnol Down Right
	for i in 0..3
		tempArray = Array.new
		returnArray = Array.new
		for j in 0..3
			tempArray.push(board[row+j-i][column+j-i])
			returnArray.push([row+j-i,column+j-i])
		end
		if tempArray.join == "#{player}#{player}#{player}#{player}"
			returnArray.reverse!
			returnArray.push(player)
			return returnArray
		end
	end

	return false
end

moves = File.readlines('226input.txt').map {|i| i.split(//).delete_if{|i| i == "\n"}}
board = Array.new()
8.times do
	board.push(Array.new(8, "-"))
end


def connectFour(moves, board)
	count = 0
	for move in moves
		count += 1
		move1 = dropper(move.first, board, "X")
		result = winner?(move1, board, "X")
		return [result,count] if result
		move2 = dropper(move.last, board, "O")
		result = winner?(move2, board, "O")
		return [result,count] if result
	end
	return false
end

winner = connectFour(moves, board)
if winner
	print "\n#{winner[0][4]} won at move #{winner[1]} (with "
	if winner[0][4] == "X"
		for slot in 0..3
			print " #{(winner[0][slot][1]+65).chr}#{winner[0][slot][0]+1}"
		end
	else
		for slot in 0..3
			print " #{(winner[0][slot][1]+97).chr}#{winner[0][slot][0]+1}"
		end
	end
	print ")\n"

	for row in 0..6
		print board[6-row].join
		puts ""
	end
else
	puts "No winner"
end