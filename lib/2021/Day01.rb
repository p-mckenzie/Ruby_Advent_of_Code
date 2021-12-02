require_relative '../Base'

module Y2021
  class Day01 < Base
    @@day = 1
    @@year = 2021

    def initialize(data=get_data)
      @data = data.split.map(&:to_i)
    end

    def triples_sum
      @data.each_cons(3).map(&:sum)
    end

    def part_1
      @data.each_cons(2).select {|a,b| a < b }.length
    end

    def part_2
      triples_sum.each_cons(2).select {|a,b| a < b }.length
    end  
  end
end

executable = Y2021::Day01.new
executable.run