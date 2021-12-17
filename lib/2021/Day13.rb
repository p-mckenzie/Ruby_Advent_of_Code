require_relative '../Base.rb'

module Y2021
  class Day13 < Base
    @@day = 13
    @@year = 2021

    def initialize(data=get_data)
      @points, @folds = data.split("\n\n")
      
      @points = @points.split("\n").map{|entry| entry.split(',').map(&:to_i)}
      @folds = @folds.split("\n")

      @board = Hash.new(false)
      @points.each {
        |point|
        @board[point] = true
      }
      
      main

    end

    def display
      xlength = @board.keys.map{|x,y| x}.max
      ylength = @board.keys.map{|x,y| y}.max

      final = (0..ylength).map {'.' * xlength}
      @board.keys.each {
        |x,y|
        final[y][x] = '#'
      }

      "\n" + final.join("\n")
    end

    def main
      @folds.each_with_index {
        |fold, index|
        folded_board = Hash.new(false)
        coordinate = fold.split('=')[1].to_i

        @board.keys.each {
            |x,y|
            if fold.include? 'x' then
              new_location = x>coordinate ? [coordinate - (x - coordinate), y] : [x,y]
            else
              new_location = y>coordinate ? [x, coordinate - (y - coordinate)] : [x,y]
            end
            
            folded_board[new_location] = true
          }
        @board = folded_board

        if index==0 then 
          @num_after_first_fold = @board.length 
        end
      }

    end

    def part_1
      @num_after_first_fold
    end

    def part_2
      display
    end  
  end
end

executable = Y2021::Day13.new
executable.run