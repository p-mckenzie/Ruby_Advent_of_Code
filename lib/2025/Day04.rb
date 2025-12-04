require_relative '../Base'

module Y2025
  class Day04 < Base
    @@day = 4
    @@year = 2025

    def initialize(data=get_data)
      @data = data.split.map{|line| line.chars.map{|char| char=='@' ? 1 : 0 }}

      @nrows = @data.size
      @ncols = @data.first.size
    end

    def neighbors(x,y)
      indexes = (-1..1).map {
        |x_offset|
        (-1..1).map {
          |y_offset|
          [x+x_offset, y+y_offset]
        }
      }.flatten(1)
      indexes.delete([x,y])

      indexes
    end

    def remove_rolls(data)
      (0...@nrows).map {
        |r|
        row = data[r]
        (0...@ncols).map {
          |c|
          val = row[c]
          if val==0 then
            0
          else
            neighbors(r,c).map {
              |x,y|
              (0...@nrows).include?(x) && (0...@ncols).include?(y) ? data[x][y] : 0
            }.sum < 4 ? 0 : 1
          end
        }
      }
    end

    def part_1
      @data.flatten.sum - remove_rolls(@data).flatten.sum
    end

    def part_2
      data = @data
      size = @data.flatten.sum
      loop do
        new_data = remove_rolls(data)
        new_size = new_data.flatten.sum

        break if new_size==size

        data, size = new_data, new_size
      end
      @data.flatten.sum - size
    end  
  end
end

executable = Y2025::Day04.new
executable.run