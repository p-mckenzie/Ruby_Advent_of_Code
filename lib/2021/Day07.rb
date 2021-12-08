require_relative '../Base.rb'

module Y2021
  class Day07 < Base
    @@day = 7
    @@year = 2021

    def initialize(data=get_data)
      @data = data.split(",").map(&:to_i)

    end

    def part_1
      (@data.min..@data.max).map { |center|
        @data.map {|x| (center-x).abs}.sum
      }.each_with_index.min[0]
    end

    def part_2
      (@data.min..@data.max).map { |center|
        @data.map {|x| (0..(center-x).abs).sum}.sum
      }.each_with_index.min[0]
    end  
  end
end

executable = Y2021::Day07.new
executable.run