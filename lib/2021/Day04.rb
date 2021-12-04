require_relative '../Base.rb'

module Y2021
  class Day04 < Base
    @@day = 4
    @@year = 2021

    def initialize(data=get_data)
      @data = data.split("\n\n")

      @numbers = @data[0].split(',').map(&:to_i)

      @boards = @data[1..-1].map {|block| block.split("\n").map {|row| row.split.map(&:to_i)}}
      @selected = @boards.map {|board| board.map {|row| row.map {|element| 0 }}}

      main
    end

    def winners
      row = @selected.map {|board| board.map {|row| row.min }.max}
      col = @selected.map {|board| board.transpose.map {|col| col.min }.max}
      [row, col].transpose.map{|x| x.max}
    end

    def score(num)
      @final_scores = Hash.new(0)
      @boards.each_with_index {|board, board_index|
        board.each_with_index {|row, row_index| 
          row.each_with_index {|element, element_index| 
            if @selected[board_index][row_index][element_index] == 0
              then @final_scores[board_index] += @boards[board_index][row_index][element_index] * num
            end
          }
        }
      }
    end

    def main
      @board_tracker = Hash.new # board index => [number index board "wins", score when wins]
      @numbers.each_with_index {|num, num_index|
        @boards.each_with_index {|board, board_index| 
          board.each_with_index {|row, row_index| 
            row.each_with_index {|element, element_index| 
              if element==num then 
                @selected[board_index][row_index][element_index] = 1
              end 
            }
          }
        }

        score(num) # updates @final_scores
        @winners = winners
        
        @winners.each_with_index {|val, board_index|
          if (val == 1) and (not @board_tracker[board_index]) then
            @board_tracker[board_index] = [num_index, @final_scores[board_index]]
          end
        }
      if @winners.min == 1 then
          break
      end
      }
      end

    def part_1
      @board_tracker.min_by {|key, val| val[0]}[1][1]
    end

    def part_2
      @board_tracker.max_by {|key, val| val[0]}[1][1]
    end  
  end
end

executable = Y2021::Day04.new
executable.run