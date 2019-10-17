########################################
# Class player :
# définir le joueur : nom + jeton
#########################################
class Player
	attr_accessor :name, :mark
	#init la class Player avec valeur de bases
	def initialize(name, mark, board)
		@name = name
		@mark = mark
		@board = board
	end

	# mise à jours de la case en fonction
	# de la valeur choisie par le joueur
	def move(cell)
		@board.update_cell(cell, self.mark)
	end
	# definition combinaisons gagnantes
	# boucle teste toutes les combinaisons gagnantes
	# s'assurer que tous jetons identiques dans l'array
	def winner?
		wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
		wins.each do |win|
			values = [cells[win[0]], cells[win[1]], cells[win[2]]]
			return true if values.include?(self.mark.to_s) && ((values[0] == values[1]) && (values[1] == values[2]))
		end
		false
	end

	private
	# permet de lier les cellules à la classe joueur
	def cells
		@board.cells
	end

end