require_relative '../Base'

module Y2024
  class Day10 < Base
    @@day = 10
    @@year = 2024

    def initialize(data=get_data)
      @data = data.split.map {
        |line|
        line.chars.map(&:to_i)
      }

      @nrows = @data.length
      @ncols = @data.first.length

      @paths = Hash.new
      (0...@nrows).each {
        |row|
        (0...@ncols).each {
          |col|
          arr = walk(row, col, -1)
          if arr && arr.length>0
            @paths[[row,col]] = arr
          end
        }
      }
    end

    def valid?(row, col)
      (0...@nrows).include?(row) & (0...@ncols).include?(col)
    end

    def walk(row, col, last_step)
      unless valid?(row, col) then return nil end

      step = @data[row][col]
 
      if last_step+1!=step
        return
      elsif step==9
        return "row:#{row} col#{col}"
      end

      [1,-1].map {
        |diff|
        [walk(row+diff, col, step), walk(row, col+diff, step)]
      }.flatten.compact
    end

    def part_1
      @paths.map{|k,v| v.uniq.length}.sum
    end

    def part_2
      @paths.values.map(&:length).sum
    end
  end
end

executable = Y2024::Day10.new
executable.run