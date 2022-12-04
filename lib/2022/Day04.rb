require_relative '../Base'

module Y2022
  class Day04 < Base
    @@day = 4
    @@year = 2022

    def initialize(data=get_data)
      @data = data.split.map{|elves| elves.split(',').map{|elf| elf.split('-').map(&:to_i)}}
    end

    def fully_contains?(elves)
      for containing, subset in elves.permutation(2)
        if containing[0] <= subset[0] and containing[1] >= subset[1] then
          return true
        end
      end
      false
    end

    def overlaps?(elves)
      for containing, subset in elves.permutation(2)
        for point in subset
          if containing[0] <= point and containing[1] >= point then
            return true
          end
        end
      end
      false
    end

    def part_1
      @data.select {|elves| fully_contains?(elves)}.length
    end

    def part_2
      @data.select {|elves| overlaps?(elves)}.length
    end  
  end
end

executable = Y2022::Day04.new
executable.run