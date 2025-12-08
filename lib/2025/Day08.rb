require_relative '../Base'

module Y2025
  class Day08 < Base
    @@day = 8
    @@year = 2025

    def initialize(data=get_data)
      @boxes = data.split.map {
        |arr| arr.split(',').map(&:to_i)
      }

      @distances = Hash.new
      (0...@boxes.size).each {
        |a_idx|
        (0...@boxes.size).each {
          |b_idx|
          next if a_idx==b_idx || @distances.include?([a_idx, b_idx].sort)
          @distances[[a_idx, b_idx].sort] = distance(@boxes[a_idx], @boxes[b_idx])
        }
      }
      @distances = @distances.sort_by { |key, value| value }.to_h
    end

    def distance(a_box, b_box)
      a_box.zip(b_box).map{|a,b| (a-b)**2}.sum
    end

    def solve(part_1=1000)
      circuits = (0...@boxes.size).map {|i| [i,i]}.to_h
      # box index -> circuit index

      result = nil
      @distances.keys.each_with_index {
        |val, i|
        a_idx, b_idx = val
        circuit_index = circuits.values.max + 1

        circuits.select{|k,v| [circuits[a_idx], circuits[b_idx]].include?(v)}.each {
          |box_idx, current_circuit|
          circuits[box_idx] = circuit_index
        }

        if i==part_1-1
          @part_1_result = circuits.values.tally.sort_by{|k,v| -v}.to_h.values[...3].inject(:*)
        end

        if circuits.values.uniq.size==1
          @part_2_result = @boxes[a_idx].first * @boxes[b_idx].first
          break
        end
      }
    end

    def part_1(n=1000)
      unless @part_1_result
        solve(n)
      end
      @part_1_result
    end

    def part_2
      unless @part_2_result
        solve
      end
      @part_2_result
    end  
  end
end

executable = Y2025::Day08.new
executable.run