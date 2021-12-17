require_relative '../Base.rb'

module Y2021
  class Day15 < Base
    @@day = 15
    @@year = 2021

    def initialize(data=get_data)
      @board = data.split.map {|row| row.split('').map(&:to_i)}
      
      @xlength = @board.length
      @ylength = @board[0].length

      main

    end

    def neighbors(x,y)
      [
        if x+1<@xlength then [x+1, y] end, #bottom
        if y-1>=0 then [x, y-1] end, #left
        if x-1>=0 then [x-1, y] end, #top
        if y+1<@ylength then [x, y+1] end, #right
      ]
    end

    def main
      initial = [0,0]

      distances = Hash.new(@board.length**3)
      distances[initial] = 0

      current_node = initial
      neighbors(*initial).each {
        |x,y|
        
      }


    end

    def extend_polymer
      next_polymer = Hash.new(0)
      @polymer.each {
        |key, val|
        to_insert = @patterns[key]
        next_polymer[key[0]+to_insert] += val
        next_polymer[to_insert+key[1]] += val
      }
      @polymer = next_polymer
    end

    def count_elements(polymer)
      counts = Hash.new(0)
      polymer.each {
        |key, val|
        counts[key[0]] += val
        counts[key[1]] += val
      }

      counts.each {
        |char, count|
        counts[char] = ((char==@template[0]) || (char==@template[-1])) ? count/2+1 : count/2
      }
      counts.values.max - counts.values.min
    end

    def part_1
      count_elements(@polymer_1)
    end

    def part_2
      count_elements(@polymer_2)
    end  
  end
end

executable = Y2021::Day15.new(data="1163751742
1381373672
2136511328
3694931569
7463417111
1319128137
1359912421
3125421639
1293138521
2311944581")
#executable.run