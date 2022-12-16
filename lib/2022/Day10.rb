require_relative '../Base'

module Y2022
  class Day10 < Base
    @@day = 10
    @@year = 2022

    def initialize(data=get_data)
      @commands = data.split("\n")
      x = 1
      cycle = 1
      @signal_strength = 0
      @drawing = "\n"

      row = 0
      go_again = true
      while row < @commands.length do

        cmd, param = @commands[row].split
        to_add = 0
        case cmd
        when 'noop'
          go_again = true
        when 'addx'
          if go_again then
            go_again = false
          else
            go_again = true
            to_add = param.to_i
          end
        end

        if go_again then
          row += 1
        end
          
        if cycle % 40 == 20 then
          @signal_strength += cycle * x
        end

        @drawing += (((cycle -1 )% 40) - 1 <= x and ((cycle -1 )% 40) + 1 >= x) ? '#' : '.'

        x += to_add
        cycle += 1

        if cycle % 40 == 1 then
          @drawing += "\n"
        end
      end
    end

    def part_1
      @signal_strength
    end

    def part_2
      @drawing
    end
  end
end

executable = Y2022::Day10.new
executable.run
