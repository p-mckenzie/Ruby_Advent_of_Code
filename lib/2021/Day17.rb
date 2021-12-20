require_relative '../Base.rb'

module Y2021
  class Day17 < Base
    @@day = 17
    @@year = 2021

    def initialize(data=get_data)
      @data = data
      @x_lower, @x_upper, @y_lower, @y_upper = @data.scan(/[-\d]+/).map(&:to_i)

      @winners = Hash.new

      (1..@x_upper*2).each {
        |x_vel|
        (@y_lower..@x_upper*2).each {
          |y_vel|
          win, max_y = check_aim(x_vel, y_vel) 
          
          if win then
            @winners[[x_vel, y_vel]] = max_y
          end
        }
      }
    end

    def check_aim(x_vel, y_vel)
      x_pos = 0
      y_pos = 0
      max_y = 0
      winner = false
      while true do
        x_pos += x_vel
        y_pos += y_vel
        y_vel += -1
        x_vel = x_vel == 0 ? 0 : x_vel - 1

        if y_pos > max_y then 
          max_y = y_pos
        end

        if x_pos>=@x_lower and x_pos <=@x_upper and y_pos>=@y_lower and y_pos <=@y_upper then
          # score
          winner = true
        end

        if x_pos>@x_upper and max_y then
          break
        end

        if y_vel < 0 and y_pos < @y_lower then
          break
        end
      end
      return winner, max_y
    end

    def part_1
      @winners.values.max
    end

    def part_2
      @winners.length
    end  
  end
end

executable = Y2021::Day17.new
executable.run