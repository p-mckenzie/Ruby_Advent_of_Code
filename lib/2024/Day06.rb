require_relative '../Base'

module Y2024
  class Day06 < Base
    @@day = 6
    @@year = 2024

    def initialize(data=get_data)
      @data = data.split("\n").map(&:chars)
      @data.each_with_index{
        |arr, index| 
        pos = arr.index('^')
        if pos
          @start = [index, pos]
          break
        end
      }

      @nrows = @data.length
      @ncols = @data.first.length

      @start_dir = [-1,0]
      @path = Hash.new { |hash, key| hash[key] = Set.new }

      @base_path, end_point = walk(@start, @start_dir, @path.clone)
    end

    def valid?(row, col)
      (0...@nrows).include?(row) & (0...@ncols).include?(col)
    end

    def walk(loc, dir, path)
      next_step = loc.zip(dir).map(&:sum)
      next_dir = dir

      row, col = next_step
      unless valid?(row, col)
        # walk off map
        path[loc].add?(dir)
        return path, next_step
      end

      char = @data[row][col]
      
      if char=='#' then
        turn_dir = dir.map{|x| x*-1}.reverse
        if turn_dir.last==0
          turn_dir = [turn_dir.first*-1, turn_dir.last]
        end
        next_step = loc
        next_dir = turn_dir
      else
        if path[loc].include?(dir)
          return path, next_step
        else
          path[loc].add?(dir)
        end
      end
      
      walk(next_step, next_dir, path)
    end

    def part_1
      @base_path.keys.length
    end

    def part_2
      @base_path.keys.map {
        |row, col|
        @data[row][col] = '#'
        path, end_loc = walk(@start, @start_dir, @path.clone)
        @data[row][col] = '.'
        if valid?(*end_loc)
          1
        else
          0
        end
      }.sum
    end
  end
end

executable = Y2024::Day06.new
executable.run