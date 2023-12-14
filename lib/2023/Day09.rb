require_relative '../Base'

module Y2023
  class Day09 < Base
    @@day = 9
    @@year = 2023

    def initialize(data=get_data)
      @data = data.split("\n").map {
        |line| 
        line.split(" ").map(&:to_i)
      }
    end

    def extrapolate(arr)
      diffs = arr.each_cons(2).collect {|first, second| second - first}
      
      arr.empty? ? 0 : arr[-1] + extrapolate(diffs)
    end


    def part_1
      @data.map{ |arr| extrapolate(arr)}.sum
    end

    def part_2
      @data.map{ |arr| extrapolate(arr.reverse)}.sum
    end
  end
end

executable = Y2023::Day09.new
executable.run
