require_relative 'board'

class Player
    attr_accessor :name, :symbol

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end

    def play_turn()
        puts "\n \n Quel case choisis tu #{@name} ?"
        print '>'
        
        return gets.chomp

    end

    def won
        puts "\n \n #{@name} a gagné"
    end
end