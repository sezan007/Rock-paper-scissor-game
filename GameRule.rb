class GameRule
    attr_accessor :moves
    def initialize(moves)
        @moves=moves
    end
    def Result(user_move,pc_move)
        p=@moves.length/2
        n=@moves.length
        if (((pc_move-user_move+p+n)%n)-p)<0
            return 1
        elsif (((pc_move-user_move+p+n)%n)-p)>0
            return -1
        else 
            return 0
        end
    end

end
# moves=["Rock","paper","Scissors"]
# a=GameRule.new(moves)
# puts a.Result(2,2)