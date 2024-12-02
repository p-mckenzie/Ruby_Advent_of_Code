require_relative '../Base'

module Y2024
  class Day01 < Base
    @@day = 1
    @@year = 2024

    def initialize(data=get_data)
      @data = data.split.map(&:to_i)

      @left = @data.each_slice(2).map(&:first)
      @right = @data.each_slice(2).map(&:last)
    end

    def part_1
      @left.sort.zip(@right.sort).map { |a, b| (b - a).abs }.sum
    end

    def part_2
      tally = @right.tally

      @left.map {|a| (tally[a] || 0) * a}.sum
    end  
  end
end

executable = Y2024::Day01.new
executable.run