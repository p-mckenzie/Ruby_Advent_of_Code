require_relative '../Base.rb'

module Y2021
  class Day11 < Base
    @@day = 11
    @@year = 2021

    def initialize(data=get_data)
      @data = data.split.map{|row| row.split('').map(&:to_i)}

      @xlength = @data.length
      @ylength = @data[0].length
      @flashes = []

      main

    end

    def display
      puts @data.map{|row| row.join(' ')}.join("\n")
      puts
    end

    def neighbors(x,y)
      [
        if x+1<@xlength then [x+1, y] end, #bottom
        if x+1<@xlength and y-1>=0 then [x+1, y-1] end, #bottom left
        if y-1>=0 then [x, y-1] end, #left
        if x-1>=0 and y-1>=0 then [x-1, y-1] end, #top left
        if x-1>=0 then [x-1, y] end, #top
        if x-1>=0 and y+1<@ylength then [x-1, y+1] end, #top right
        if y+1<@ylength then [x, y+1] end, #right
        if x+1<@xlength and y+1<@ylength then [x+1, y+1] end, #bottom right
      ]
    end

    def flash(x,y)
      # update number of flashes in this time period
      @flashes[-1] += 1

      # reset the octopus that flashed
      @data[x][y] = 0

      neighbors(x,y).compact.each {
        |neighbor_x, neighbor_y|
        #puts neighbor_x.class, neighbor_y.class
        unless @data[neighbor_x][neighbor_y]==0 then
          @data[neighbor_x][neighbor_y] += 1
        end

        if @data[neighbor_x][neighbor_y] > 9 then
          flash(neighbor_x, neighbor_y)
        end
      }
    end

    def time_passes(epoch)
      # store a new "zero" for each time period
      @flashes << 0

      (0...@xlength).each {
        |x|
        (0...@ylength).each {
          |y|
          #puts "#{x}, #{y}, #{@data[x][y]}"
          @data[x][y] += 1
        }
      }

      (0...@xlength).each {
        |x|
        (0...@ylength).each {
          |y|
          #puts "#{x}, #{y}, #{@data[x][y]}"
          if @data[x][y] > 9 then
            flash(x,y)
          end
        }
      }

      if @flashes[-1] == (@xlength * @ylength) then
        @all_flash = epoch+1
      end
    end

    def main
      epoch = 0

      while not @all_flash do
        time_passes(epoch)
        epoch += 1
      end
    end

    def part_1
      @flashes[0...100].sum
    end

    def part_2
      @all_flash
    end  
  end
end

executable = Y2021::Day11.new
executable.run