require_relative '../Base'

module Y2022
  class Day08 < Base
    @@day = 8
    @@year = 2022

    def initialize(data=get_data)
      @trees = data.split.map{|row| row.split('').map(&:to_i)}
      @row_border, @col_border = [@trees.length-1, @trees[0].length-1]
    end

    def views(row, col)
      [
        # up
        @trees.map{|row| row[col]}[0...row].reverse,
        # down
        @trees.map{|row| row[col]}[row+1..],
        # left
        @trees[row][0...col].reverse,
        # right
        @trees[row][col+1..],
      ]
    end

    def visible(row, col)
      tree_height = @trees[row][col]
      if (row==0) or (col==0) or (row==@row_border) or (col==@col_border) then
        return true
      end

      views(row, col).map {|arr| arr.max < tree_height}.any?
    end

    def viewing_distance(row,col)
      tree_height = @trees[row][col]
      views(row,col).map{
        |view| 
        view[0..view.map{
          |tree| tree >= tree_height
          }.index(true)].length
        }.inject(:*)
    end

    def loops(proc)
      (0..@row_border).map do
        |row|
        (0..@col_border).map do
          |col|
          proc.call(row,col)
        end
      end
    end

    def part_1
      loops(Proc.new { |row,col| visible(row,col)}).flatten.select{ |a| a}.length
    end

    def part_2
      loops(Proc.new { |row,col| viewing_distance(row, col)}).flatten.max
    end
  end
end

executable = Y2022::Day08.new
executable.run