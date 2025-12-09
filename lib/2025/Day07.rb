require_relative '../Base'

module Y2025
  class Day07 < Base
    @@day = 7
    @@year = 2025

    def initialize(data=get_data)
      @data = data.split.map(&:chars)
      @start = @data.first.find_index('S')

      @nrows = @data.size

      solve
    end

    def solve
      nrow = 0
      @locs = {@start => 1}
      @splits = 0

      (0...@nrows).each {
        |nrow|
        row = @data[nrow]

        new_locs = Hash.new(0)
        @locs.each {
          |loc,n|
          if row[loc]=='^'
            @splits += 1
            new_locs[loc+1] += n
            new_locs[loc-1] += n
          else
            new_locs[loc] += n
          end
        }
        @locs = new_locs
      }
    end

    def part_1
      @splits
    end

    def part_2
      @locs.values.sum
    end  
  end
end

executable = Y2025::Day07.new
executable.run