require_relative '../Base'

module Y2023
  class Day04 < Base
    @@day = 4
    @@year = 2023

    def initialize(data=get_data)
      @copies = Hash.new

      @data = data.split("\n").map{
        |line|
        line = line.split(" ")
        @copies[line[1][0...-1].to_i] = 1
        [line[2...line.index("|")].map(&:to_i), line[line.index("|")+1..].map(&:to_i)]
      }

      @points = @data.each_with_index.map {
        |entry, index|
        winners, you = entry

        your_wins = you.filter{ |num| winners.include?(num)}
        (index+2..your_wins.length+index+1).each {
          |ticket|
          @copies[ticket] += @copies[index+1]
        }

        unless your_wins.empty? then
          2**(your_wins.length-1)
        else 
          0
        end
      }
    end

    def part_1
      @points.sum
    end

    def part_2
      @copies.values.sum
    end
  end
end

executable = Y2023::Day04.new
executable.run
