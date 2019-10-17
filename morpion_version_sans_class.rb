# Retour gagant
wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
# Fill la grille
cells = []
(0..8).each { |n| cells << "#{n + 1}"}
#affiche le morpion
def show_board(cells)
		row1 = " " + cells[0] + " | " + cells[1] + " | " + cells[2]
		row2 = " " + cells[3] + " | " + cells[4] + " | " + cells[5]
		row3 = " " + cells[6] + " | " + cells[7] + " | " + cells[8]
		puts row1
		puts "---+---+---"
		puts row2
		puts "---+---+---"
		puts row3
end
# tu joue sur quelle case ?????
def player(mark)
	choix = 0
	until ((choix > 0) && (choix < 10))
		puts "Joueur #{mark} : Quelle case (1 à 9) ?"
		choix = gets.chomp.to_i
	end
	return choix
end
# c'est ton tour, mon tour, ton tour
def change_XO(signe)
	if signe == "X"
		return "O"
	else
		return "X"
	end
end
# Check le winner
def winner(cells)
	wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
	wins.each do |win|
		values = [cells[win[0]], cells[win[1]], cells[win[2]]]
		return true if ((values[0] == values[1]) && (values[1] == values[2]))
	end
	false
end

# Vas-y, joue
signe = "O"
show_board(cells)
tour = 1
until (tour > 9)
	puts "tour : #{tour}"
	signe = change_XO(signe)
	a = player(signe)
	if ((cells[a - 1] == "X") || (cells[a - 1] == "O"))
		puts "Sorry, #{a} déja pris!"
	else
		tour += 1
		cells[a - 1] = signe
		if winner(cells)
			puts "Joueur #{signe} a gagné !!!!!!!!!!!!!!!!!!!!!!"
			puts "Joueur #{signe} a gagné !!!!!!!!!!!!!!!!!!!!!!"
			puts "Joueur #{signe} a gagné !!!!!!!!!!!!!!!!!!!!!!"
			return
		else
			show_board(cells)
		end
	end
end

