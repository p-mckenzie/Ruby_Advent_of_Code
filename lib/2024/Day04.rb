require_relative '../Base'

module Y2024
  class Day04 < Base
    @@day = 4
    @@year = 2024

    def initialize(data=get_data)
      @data = data.split("\n").map(&:chars)
      @nrows = @data.length
      @ncols = @data.first.length
    end

    def check(loc, dir, index)
      if index>=@pattern.length
        return true
      end
      
      row, col = loc
      unless (0...@nrows).include?(row) & (0...@ncols).include?(col) 
        return false 
      end
      char = @data[row][col]
      
      if char==@pattern[index] then
        check(loc.zip(dir).map(&:sum), dir, index+1)
      else
        false
      end
    end

    def iter
      map = Hash.new { |hash, key| hash[key] = [] }

      (0...@nrows).each {
        |row|
        (0...@ncols).each {
          |col|
          @directions.each {
            |dir|
            if check([row, col], dir, 0)
              map[[row, col].zip(dir).map(&:sum)].push(dir)
            end
          }
        }
      }

      map
    end

    def part_1
      @pattern = 'XMAS'.chars
      @directions = [1, 0, -1].product([1, 0, -1])

      iter.values.flatten(1).length
    end

    def part_2
      @pattern = 'MAS'.chars
      @directions = [1, -1].product([1, -1])

      iter.select {|key, val| val.map{|x|x.inject(&:*)}.sort == [-1,1]}.length
    end  
  end
end

executable = Y2024::Day04.new
executable.run