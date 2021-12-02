require_relative '../Base.rb'

module Y2021
  class Day02 < Base
    @@day = 2
    @@year = 2021

    def initialize(data=get_data)
      @data = data.split("\n")

      @vertical_1 = 0
      @horizontal_1 = 0

      @aim = 0
      @vertical_2 = 0
      @horizontal_2 = 0

      main
    end

    def main
      @data.each {|s|
      direction, num = s.split
      num = num.to_i
      case direction
      when "down"
        @vertical_1 += num
        @aim += num
      when "up"
        @vertical_1 += -num
        @aim += -num
      when "forward"
        @horizontal_1 += num

        @horizontal_2 += num
        @vertical_2 += @aim * num


      end
    }
    end

    def part_1
      @horizontal_1 * @vertical_1
    end

    def part_2
      @horizontal_2 * @vertical_2
    end  
  end
end

executable = Y2021::Day02.new
executable.run