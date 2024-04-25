# Check if any arguments are provided
require_relative 'HelpTable.rb'
require_relative 'HMACGenerator'
require_relative 'GameRule'
if ARGV.empty?
    puts "No arguments provided."
elsif ARGV.length>=3
    if ARGV.length%2==0
        puts "Provide odd number of arguments"
    else
        counter=1
        while true
            pc_move=rand(0..ARGV.length-1) #randomly generating pc move
            hmac1=HMACGenerator.new(ARGV[pc_move])
            hmacs=hmac1.generate_hmac()
            if counter==1
                puts "1st Round"
            else
                puts "#{counter}nd Round"
            end
            puts "HMAC: #{hmacs[0]}"
            puts "Available moves"
            ARGV.each_with_index do |arg, index|
                puts "#{index + 1} - #{arg}"
            end
            puts "0 - exit"
            puts "? - help"
            print "Enter your move:"
            input=STDIN.gets.chomp
            puts ""
            
            case input
            when "0"
                break
            when "?"
                table=HelpTable.new(ARGV)
                table.GenearateTable()
            else 
                input=input.to_i
                if input>=0 and input<=ARGV.length
                    game=GameRule.new(ARGV)
                    result=game.Result(input-1,pc_move)
                    puts "Your move: #{ARGV[input-1]}"
                    puts "Computer move: #{ARGV[pc_move]}"
                    case result
                    when 1
                        puts "You win!"
                    when -1
                        puts "You Lose!"
                    when 0
                        puts "Draw!"
                    end
                    puts "HMAC key: #{hmacs[1]}"
                    counter+=1
                    
                else
                    puts "Invalid Input"
                end
                
            end
        end
    end
else
    puts "Provide at least 3 arguments"
end
  