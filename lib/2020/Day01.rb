require_relative '../Base.rb'

module Y2020
  class Day01 < Base
    @@day = 1
    @@year = 2020

    def initialize(data=get_data)
      @data = data.split.map(&:to_i)
    end
    
    def sums_to(arr, num:2020)
      arr.sum() == num
    end

    def find_elements_product(size)
      elements = @data.map(&:to_i).combination(size).to_a.select {|arr| sums_to(arr) }[0]
      elements.inject(:*)
    end

    def part_1
      find_elements_product(2)
    end

    def part_2
      find_elements_product(3)
    end
    
  end
end

executable = Y2020::Day01.new
executable.run