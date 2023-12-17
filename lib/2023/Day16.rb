require_relative '../Base'

module Y2023
  class Day16 < Base
    @@day = 16
    @@year = 2023

    def initialize(data=get_data)
      @map = data.split("\n").map {
        |line|
        line.chars
      }
      @col_lim = @map.length - 1
      @row_lim = @map.first.length - 1
    end

    def reflect(col, row, col_dir, row_dir)
      if col<0 or row<0 or col>@col_lim or row>@row_lim
        return
      end

      # if we've visited this space in this direction, no need to continue
      if @energized[[col, row]].include?([col_dir, row_dir]) then
        return
      else 
        @energized[[col, row]].add([col_dir, row_dir])
      end

      case @map[col][row]
      when '.'
        reflect(col+col_dir, row+row_dir, col_dir, row_dir)
      when '/'
        if row_dir==1 then
          reflect(col-1, row, -1, 0)
        elsif row_dir==-1 then
          reflect(col+1, row, 1, 0)
        elsif col_dir==-1 then
          reflect(col, row+1, 0, 1)
        elsif col_dir==1 then
          reflect(col, row-1, 0, -1)
        end
      when "\\"
        if row_dir==1 then
          reflect(col+1, row, 1, 0)
        elsif row_dir==-1 then
          reflect(col-1, row, -1, 0)
        elsif col_dir==1 then
          reflect(col, row+1, 0, 1)
        elsif col_dir==-1 then
          reflect(col, row-1, 0, -1)
        end
      when '|'
        if col_dir==1 or col_dir==-1 then
          reflect(col+col_dir, row+row_dir, col_dir, row_dir)
        else
          # split
          reflect(col+1, row, 1, 0)
          reflect(col-1, row, -1, 0)
        end
      when '-'
        if row_dir==1 or row_dir==-1 then
          reflect(col+col_dir, row+row_dir, col_dir, row_dir)
        else
          reflect(col, row+1, 0, 1)
          reflect(col, row-1, 0, -1)
        end
      end
    end

    def walk_path(start_col, start_row, col_dir, row_dir)
      @energized = Hash.new{|h,k| h[k] = Set.new }
      reflect(start_col, start_row, col_dir, row_dir)
      @energized.length
    end

    def part_1
      walk_path(0, 0, 0, 1)
    end

    def part_2
      (0..@col_lim).map {
        |col|
        (0..@row_lim).map {
          |row|
          # only consider edes
          if [0, @col_lim].include?(col) ^ [0, @row_lim].include?(row) then
            [-1,0,1].map {
              |col_dir|
              [-1,0,1].map {
                |row_dir|
                # only consider a single axis of movement
                unless ((col_dir==0) ^ (row_dir==0)) then next end
                walk_path(col, row, col_dir, row_dir)
                }
            }
          end
        }
      }.flatten.compact.max
    end
  end
end

executable = Y2023::Day16.new
executable.run
