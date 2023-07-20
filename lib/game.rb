require_relative 'player'
require_relative 'board'


class Game
    attr_accessor :board, :players, :nmb_game
    def initialize()
        # initialise les 2 joueurs et commence la partie

        puts 'Bienvenue dans ce jeu de morpion'
        
        puts "Quel est le nom du joueur 1 ?"
        print '>'
        player1 = Player.new(gets.chomp, 'X')
        
        puts "Quel est le nom du joueur 2 ?"
        print '>'
        player2 = Player.new(gets.chomp, 'O')
        
        @players = [player1, player2]
        
        @nmb_game = 0
        begin_game()
    end

    def begin_game
        #on incremente le nmb de parties & on créer une nouvelle board 
        @nmb_game += 1
        @board = Board.new
        play()
    end
    
    def play
        #boucle tant qu il n y a pas de break 
        while true
            
            #display la board et fait jouer player 1
            @board.display_board(@nmb_game)
            play_turn(@players[0])
            
            if @board.is_won?
                #on affiche une derniere fois la board et on annonce le resultat
                @board.display_board(@nmb_game)
                @players[0].won
                break
                #un match nul ne peut arriver qu'apres le dernier coup du player1
            elsif @board.is_null?
                #on affiche une derniere fois la board et on annonce le resultat
                @board.display_board(@nmb_game)
                puts "\n \n Match nul"
                break
            end
            
            #display la board et fait jouer player 2
            @board.display_board(@nmb_game)
            play_turn(@players[1])

            if @board.is_won?
                #on affiche une derniere fois la board et on annonce le resultat
                @board.display_board(@nmb_game)
                @players[1].won
                break
            end
        end

        end_game()
    end
    
    def play_turn(player)
        move = player.play_turn
        
        #check que le mouvement soit valide
        if @board.is_move_allowed?(move)
            #si le mouvement est valide on place le symbole
            @board.play_move(move, player.symbol)
        else
            #sinon on relance le tour
            play_turn(player)
        end
        
    end

    def end_game
        puts "\n Voulez-vous recommencer ? [yes/no]"
        print '>'
        case gets.chomp
        when 'yes'
            #si oui on relance la partie en gardant les memes joueurs
            begin_game()
        when 'no'
            #si non rien ne se passe et on exit le programme
        else
            #relance la methode si on recoit un mauvais input
            puts "Ecrivez soit 'yes' soit 'no'"
            end_game()
        end

    end
    
    
end