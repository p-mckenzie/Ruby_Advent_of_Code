require_relative '../Base'

module Y2022
  class Day01 < Base
    @@day = 1
    @@year = 2022

    def initialize(data=get_data)
      @data = data.split("\n\n").map(&:split).map { |ar| ar.map(&:to_i).sum }.sort.reverse
    end

    def part_1
      @data[0]
    end

    def part_2
      @data[0..2].sum
    end  
  end
end

executable = Y2022::Day01.new
executable.run