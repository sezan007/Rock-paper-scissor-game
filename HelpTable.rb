require 'terminal-table'
class HelpTable
  attr_accessor :moves
  def initialize(moves)
    @moves=moves
  end
  def GenearateTable()
    n=@moves.length
    p=n/2
    table1 = Terminal::Table.new do |t|
      (@moves.length()+1).times do |i|
        if i==0
          a=@moves.dup
          a.unshift('v PC\User >')
          t.add_row(a)
          t.add_separator
        else
          str=Array.new()
          @moves.length.times do |j|
            if (((i-1-j+p+n)%n)-p)==0
              str.push("Draw")
            elsif (((i-1-j+p+n)%n)-p)<0
              str.push("Win")
            else
              str.push("Lose")
            end
          end
          str.unshift(@moves[i-1])
          t.add_row(str)
          t.add_separator if i-1<@moves.length-1
        end
      end
    end
    puts "The result is shown from the user perspective"
    puts table1
  end
end