require_relative '../Base'

module Y2022
  class Day14 < Base
    @@day = 14
    @@year = 2022

    def initialize(data=get_data)
      @map = Hash.new
      data.split("\n").each {
        |line|
        points = line.scan(/[\d]+/).map(&:to_i)
        (0...points.length/2 - 1).each {
          |i|
          x_range, y_range = points[i*2..i*2+1].zip(points[i*2+2..i*2+3]).map(&:minmax)
          (x_range[0]..x_range[1]).each {
            |x|
            (y_range[0]..y_range[1]).each {
              |y|
              @map[[x,y]] = '#'
            }
          }
        }
      }
    end

    def drop_sand(y_bound: nil)
      while true do
        x, y = 500, 0
        if @map[[x,y]] then 
          return 
        end
        while true do
          if y_bound then
            if y >= y_bound then
              # come to rest
              break
            end
          else
            if y+1 > @map.keys.map(&:last).max then
              # fell into the void
              return
            end
          end

          if !@map[[x, y+1]] then
            # fall down 1
            y += 1
          elsif !@map[[x-1, y+1]] then
            # left diagonal
            y += 1
            x -= 1
          elsif !@map[[x+1, y+1]] then
            # right diagonal
            y += 1
            x += 1
          else
            # come to rest
            break
          end
        end
        @map[[x, y]] = 'O'
      end
    end

    def part_1
      drop_sand
      @map.select{|key,val| val=='O'}.length
    end

    def part_2
      drop_sand(y_bound: @map.keys.map(&:last).max + 1)
      @map.select{|key,val| val=='O'}.length
    end
  end
end

executable = Y2022::Day14.new
executable.run