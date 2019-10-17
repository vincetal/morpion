########################################
# Classe Plateau de Jeu
########################################
class Board
	attr_accessor :cells
	# mise à jours du tableau
	# fonction des input du joueur
	# assure que cellule vide
	def initialize
		@cells=["1","2","3","4","5","6","7","8","9"]
	end

	# Affiche corps tableau 
	# valeur base + ligne verticale et horizontale
	def update_cell(number, mark)
		if cell_free?(number)
			self.cells[number -1] = mark.to_s
			show_board
		else
			puts "Cell is not empty! Choose another cell."
			return false
		end
	end

	# permet de limiter cette methode à la classe board
	# remplacer les cellules par le signe du joueur
	# en checkant si elles sont vides
	# sinon celllule n'est pas complétée
	def show_board
		row1 = " " + self.cells[0] + " | " + self.cells[1] + " | " + self.cells[2]
		row2 = " " + self.cells[3] + " | " + self.cells[4] + " | " + self.cells[5]
		row3 = " " + self.cells[6] + " | " + self.cells[7] + " | " + self.cells[8]
		separateur = "---+---+---"
		puts row1
		puts separateur
		puts row2
		puts separateur
		puts row3
	end
	# permet de limiter cette methode à la classe Board
	private
	# Ppermet de Remplacer les cellules par signe dju joueur
	# en checkant si vide
	# sinon cellule pas complété
	def cell_free?(number)
		cell = self.cells[number-1]
		if ((cell == "X")||(cell == "O"))
			false
		else
			true
		end
	end
end
