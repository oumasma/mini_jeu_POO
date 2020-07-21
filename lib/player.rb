require 'pry'

class Player   #classe qui modélise un joueur
	attr_accessor :name, :life_points

	def initialize(name) #méthode qui ne prend que le nom en entrée car même niveau de vie au début
		@name = name       #le nom du player
		@life_points = 10  #ici chaque player a un niveau de vie
	end

	def show_state  #méthode qui va aficher l'état du joueur
		puts "#{@name} a #{@life_points} points de vie" #le nombre de points de vie
	end

	def gets_damage (damage_receved) #methode qui fait baisser le niveau de vie du player (integer)
		@life_points = @life_points - damage_receved #on soustrait les damage au niveau de vie
			if @life_points <= 0 # si le player n'a plus de vie
				puts "le joueur #{name} a été tué !" # on lui signifie
			else
				show_state   #sinon on appelle la méthode pour afficher l'état du joueur
			end
	end

	def attacks (player) #méthode pour qu'un joueur attaque un autre : player attaqué 
   	puts "Le joueur #{self.name} attaque le joueur #{player.name}"
   damage = compute_damage 
		puts "il lui inflige #{damage} points de dommages"
		player.gets_damage(damage) # on appelle la méthode qui retire les points de damage
	end

	def compute_damage #methode qui calcule les damage
			return rand(1..6)
	end
end