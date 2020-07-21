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

class HumanPlayer < Player #classe jouée par un humain, hérite de la classe Player 
attr_accessor :weapon_level, :life_points #attribut qui definit le niveau de l'arme de HumanPlayer

	def initialize (name) #que le nom en entrée
		@life_points = 100
		@weapon_level = 1 #integer
	end

	def show_state  #méthode qui va aficher l'état du joueur et de son arme
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}" #le nombre de points de vie et niveau de l'arme
	end

	def compute_damage
    rand(1..6) * @weapon_level # on mulitplie les dégats 
  end

  def search_weapon     # methode pour chercher un nouvelle arme
  	new_weapon = rand(1..6)   # une valeur aléatoire pour la nouvelle arme
  		puts "tu as trouvé une arme de niveau #{new_weapon} !"
  	if new_weapon > @weapon_level   # on cherche si la nouvelle arme est meilleure
  		puts "Super ! elle est meilleure que ton arme actuelle : prends-là."
  		new_weapon
  	else
  		puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
  	end
  end

  def search_health_pack    # methode pour chercher un pack de vie
  	health_pack = rand(1..6)   # une valeur aleatoire pour le pack de vie
  	
  	if health_pack == 1  # on augmente rien
  		puts "pff...tu n'as rien trouvé"
  	
  	elsif health_pack >= 2 && health_pack <= 5   # si le pack est compris entre 2 et 5 inclus
  		puts "Bravo, tu as trouvé un pack de +50 points de vie !"
  		if @life_points >= 50    # on veut que la vie ne depasse pas 100 : 
  			@life_points = 100   # si sa vie initiale depasse 50 --> on la met à 100
  		else
  		@life_points = @life_points + 50 # sinon on l'augmente de 50 points
  		end
  	
  	elsif health_pack ==6 #si le pack est tombe sur 6
  		puts "Waow, tu as trouvé un pack de +80 points de vie !"
  		if @life_points >= 20   # on veut que la vie ne depasse pas 100 :
  			@life_points = 100 #si sa vie initiale depasse 20 --> on la met à 100
  		else 
  		@life_points = @life_points + 80 # sinon on l'augmente de 80 points
  		end
  	end
  end	


end

















