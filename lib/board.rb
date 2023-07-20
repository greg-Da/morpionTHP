class Board
    attr_accessor :board
    
    def initialize
        #initialise la board et ses cases
        a = [nil, nil, nil]
        b = [nil, nil, nil]
        c = [nil, nil, nil]
        @board = [a, b, c]
    end
    
    def display_board(nmb_game)
        #clear le terminal puis affiche le nombre de partie
        system("clear")
        puts "Partie n #{nmb_game}"

        #affiche le nom des colonnes
        print "\n  | A | B | C |"

        3.times do |row|
            #affiche les bordures et le nom des lignes
            puts "\n---------------"
            print "#{row + 1} |"

            #affiche le contenue des cases
            3.times do |col|
                if @board[col][row] == nil
                    print "   |"
                elsif @board[col][row] == "X"
                    print " X |"
                else
                    print " O |"
                end
            end
        end
        
    end
    
    def is_move_allowed?(move)
        #formatte la string que l on recoit
        formatted_move = format_move_string(move)
        
        #check si la case existe
        if formatted_move[0] == false || formatted_move[1] < 1 || formatted_move[1] > 3
            puts 'Mauvais choix de case'
            return false
        #check si la case est deja prise
        elsif @board[formatted_move[0]][formatted_move[1] - 1] != nil
            puts 'Tu ne peux pas jouer ici'
            return false
        else
            #sinon return true
            return true
        end
        
    end
    
    def format_move_string(move)
        #check que le 1er caractere est bien 'a', 'b' ou 'c'
        case  move[0].downcase
        when 'a'
            row = 0
        when 'b'
            row = 1
        when 'c'
            row = 2
        else
            return [false, move[1].to_i]
        end

        #convertie le 2nd caractere en integer
        col = move[1].to_i
        
        return [row, col]
        
    end
    
    def play_move(move, symbol)
        #formatte la string que l on recoit
        formatted_move = format_move_string(move)
        
        #donne le bon symbole a la case
        @board[formatted_move[0]][formatted_move[1] - 1] = symbol
    end
    
    def is_won?
        3.times do |index|
            #check si il y a victoire par colonne
            if @board[index][0] == @board[index][1] && @board[index][0] == @board[index][2] && @board[index].include?(nil) == false
                return true
                
                #check si il y a victoire par ligne
            elsif @board[0][index] == @board[1][index] && @board[0][index] == @board[2][index] && @board[0][index] != nil
                return true
            end
        end
        #check victoire par diagonale
        if @board[0][0] == @board[1][1] && @board[0][0] == @board[2][2] && @board[1][1] != nil
            return true
        elsif @board[0][2] == @board[1][1] && @board[0][2] == @board[2][0] && @board[1][1] != nil
            return true
            
            #si rien n est le cas au dessus return true
        else
            return false
        end
    end
    
    def is_null?
        #check pour match nul
        if @board.flatten.include?(nil) == false
            return true
        else
            return false
            
        end
    end
end