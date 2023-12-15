require_relative '../Base'
require 'byebug'

module Y2023
  class Day14 < Base
    @@day = 14
    @@year = 2023

    def initialize(data=get_data)
      @data = data.split("\n").map(&:chars)
    end

    def tilt(arr)
      # current O loc to new O loc
      move = Hash.new

      current = 0
      arr.each_with_index {
        |char, i| 
        case char
        when '.'
          next
        when 'O'
          if i!=current then
            move[i] = current
          end
          current += 1
        when '#'
          current = i + 1
        end
      }

      final = arr.clone
      move.each {
        |current, target| 
        final[target] = 'O'
        final[current] = '.'
      }
      final
    end

    def load(rocks)
      rocks.transpose.map {
        |col|
        col.each_with_index.map {
          |char, i|
          char=='O' ? col.length-i : 0 
        }
      }.flatten.sum
    end

    def north(rocks); rocks.transpose.map {|col| tilt(col) }.transpose end
    def south(rocks); rocks.transpose.map(&:reverse).map {|col| tilt(col) }.map(&:reverse).transpose end
    def east(rocks); rocks.map(&:reverse).map {|col| tilt(col) }.map(&:reverse) end
    def west(rocks); rocks.map {|col| tilt(col) } end

    def part_1
      rocks = north(@data)
      load(rocks)
    end

    def spin(rocks)
      rocks = north(rocks)
      rocks = west(rocks)
      rocks = south(rocks)
      east(rocks)
    end

    def part_2
      target = 1000000000
      rocks = @data

      guide = Hash.new # rock layout to cycle
      cycle = 0
      while true do
        layout = rocks.join
        if guide.key?(layout) then
          harmonic = cycle - guide[layout]

          ((target - cycle) % harmonic).times do 
            rocks = spin(rocks)
          end
          break
        else
          guide[rocks.join] = cycle
        end
        rocks = spin(rocks)
        cycle += 1        
      end
      load(rocks)
    end
  end
end

executable = Y2023::Day14.new
executable.run
