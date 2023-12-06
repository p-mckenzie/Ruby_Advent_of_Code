require_relative '../Base'

module Y2023
  class Day06 < Base
    @@day = 6
    @@year = 2023

    def initialize(data=get_data)
      @times, @records = data.split("\n").map{ 
        |line|
        line.scan(/[0-9]+/).map(&:to_i)
    }
    end

    def get_range(max, record)
      # quadratic formula
      sqrt = (max**2 - 4*record)**0.5
      bottom = (max - sqrt) / 2
      top = (max + sqrt) / 2

      # we're solving for equal times, if it's an integer
      # we want the next time, since matching the record will not beat it
      if (top - top.floor).zero? then
        top -= 1
      end
      if (bottom - bottom.floor).zero? then
        bottom += 1
      end

      return (top.floor) - (bottom.ceil) + 1
    end

    def part_1
      (0...@times.length).map {
        |i|
        get_range(@times[i], @records[i])
      }.inject(:*)
    end

    def part_2
      time = @times.map(&:to_s).join.to_i
      record = @records.map(&:to_s).join.to_i

      get_range(time, record)
    end
  end
end

executable = Y2023::Day06.new
executable.run
