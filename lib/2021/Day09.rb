require_relative '../Base.rb'

module Y2021
  class Day09 < Base
    @@day = 9
    @@year = 2021

    def initialize(data=get_data)
      @data = data.split.map{|row| row.split('').map(&:to_i)}

      @xlength = @data.length
      @ylength = @data[0].length

      main

    end

    def neighbors(x,y)
      [
        if x+1<@xlength then @data[x+1][y] end,
        if y+1<@ylength then @data[x][y+1] end,
        if x-1>=0 then @data[x-1][y] end,
        if y-1>=0 then @data[x][y-1] end,
      ]
    end

    def main
      @low_points = []
      @closest_low_point = (0..@xlength).map { (0..@ylength).map { nil }}

      # identify the low points

      (0...@xlength).each {
        |x|
        (0...@ylength).each {
          |y|
          if @data[x][y] < neighbors(x,y).compact.min then
            @low_points << [x,y]
            @closest_low_point[x][y] = @low_points.length-1
          end
        }
      }
      
      # process low points, then neighboring points, identifying the "basin" each belongs to
      to_process = @low_points
      next_to_process = []

      while to_process.length>0 do
        
        to_process.each {
          |x,y|
          low_point = @closest_low_point[x][y]
          
          [-1,1].each {
            |offset|
            
            test_x = x+offset
            if test_x>=0 and test_x<@xlength then
              if @data[test_x][y]<9 and @data[test_x][y]>@data[x][y] and not @closest_low_point[test_x][y] then
                @closest_low_point[test_x][y] = low_point
                next_to_process << [test_x, y]
              end
            end

            test_y = y+offset
            if test_y>=0 and test_y<@ylength then
              if @data[x][test_y]<9 and @data[x][test_y]>@data[x][y] and not @closest_low_point[x][test_y] then
                @closest_low_point[x][test_y] = low_point
                next_to_process << [x, test_y]
              end
            end
          }
        }
        to_process = next_to_process
        next_to_process = []

      end
      @basin_sizes = @closest_low_point.flatten.compact.group_by{|e| e}.map{|k, v| [k, v.length]}.to_h

    end

    def part_1
      @low_points.map{|arr| @data[arr[0]][arr[1]] + 1 }.sum
    end

    def part_2
      @basin_sizes.values.sort_by{|v|-v}[0..2].inject(:*)
    end  
  end
end

executable = Y2021::Day09.new
executable.run