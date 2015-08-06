

def dropper(move, board, player)
	column = move.downcase.ord-97
	row = 0
	until board[row][column] == "-"
		row += 1
	end
	board[row][column] = player
	return [row, column]
end

def winner?(move, board)
	row, column = move[0], move[1]
	for i in 0..3
		if board[row][column] == board[row][column-3+i] and board[row][column] != "-"
			if board[row][column] == board[row][column-2+i]
				if board[row][column] == board[row][column-1+i]
					return ["#{row}","#{column}"]
				end
			end
		end
	end
	return false
end

moves = File.readlines('226input.txt').map {|i| i.split(//).delete_if{|i| i == "\n"}}
board = Array.new()
7.times do
	board.push(Array.new(7, "-"))
end

def connectFour(moves, board)
	for move in moves
		move1 = dropper(move.first, board, "X")
		return "winner!" if winner?(move1, board) != false
		move2 = dropper(move.last, board, "O")
	end
end

puts connectFour(moves, board)

for each in board
	print each.join
	puts ""
end