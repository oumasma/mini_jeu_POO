require 'bundler'
Bundler.require

require_relative 'lib/game' 
require_relative 'lib/player'


puts" 
==========================================
               ✯╾━╤デ╦︻✯\n
Bienvenue sur ILS VEULENT TOUS MA POO !      
Serez-vous le dernier survivant ?
============================================"


#def create_player
	puts "Quel est ton prénom ?" #on crée unplyer humain
	print ">" 
	human_name = gets.chomp.to_s
	human = HumanPlayer.new(human_name)
	puts human.name
#end

#def create_enemies     #on crée des ennemis stocké dans un array
	enemie1 = Player.new("Josiane")
	enemie2 = Player.new("José")
	enemies = [enemie1,enemie2]
#end


while human.life_points >0 && (enemie1.life_points > 0 || enemie2.life_points >0) #on crée une condition pour rester dans le jeu
  puts
  puts "***** Voici ton état *****"    
	puts human.show_state 
	puts "Quelle action veux-tu effectuer ? Tape la lettre indiquée : "  #on demande au player de faire un choix
	puts "> a : chercher une meilleure arme"
	puts "> s : chercher à se soigner"
	puts
	puts "attaquer un joueur en vue :"
	puts "> 0 : #{enemie1.show_state}"
	puts "> 1 : #{enemie2.show_state}" 
	
	choice = gets.chomp.to_s # le player choisit
		
		if choice == "a"
			human.search_weapon
		elsif choice == "s"
			human.search_health_pack
		elsif choice == "0"
			human.attacks(enemie1)
		else choice == "1"
			human.attacks(enemie2)
		end

		if enemie2.life_points>0 && enemie1.life_points> 0  #la condition pour que les ennemis attaquent
		puts
		puts "***** Attention : Les ennemies t'attaquent ! *****"
		puts
		end

		enemies.each do | enemie |   #un each tant que les ennemis sont en vie
    	if enemie.life_points > 0
      	enemie.attacks(human)
      end
      if enemie.life_points <= 0
      	break
      end
    end
end


puts "La partie est finie"   #la partie est finie 
	if human.life_points > 0 || ennemies.life_points <= 0
		puts "BRAVO ! TU AS GAGNE FACE AUX MECHANTS"
	else
		puts "Oh non ! Tu es dead : tu as perdu !"
	end

puts "============================================"

binding.pry
