require_relative '../Base'

module Y2024
  class Day08 < Base
    @@day = 8
    @@year = 2024

    def initialize(data=get_data)
      @map = Hash.new { |hash, key| hash[key] = [] }
      @data = data.split("\n")
      @data.each_with_index {
        |line, row|
        line.chars.each_with_index {
          |char, col|
          if char=='.'
            next
          end
          @map[char].push([row, col])
        }
      }

      @nrows = @data.length
      @ncols = @data.first.length
    end

    def valid?(row, col)
      (0...@nrows).include?(row) & (0...@ncols).include?(col)
    end

    def explode(point, slope, limit)
      result = limit ? [] : [point]
      while true
        point = point.zip(slope).map(&:sum)
        if valid?(*point)
          result.push(point)
        else
          break
        end

        if limit then break end
      end
      result
    end

    def solve(limit=true)
      antinodes = Hash.new { |hash, key| hash[key] = [] }
      @map.each {
        |freq, locs|
        locs.product(locs).each {
          |one, two|
          if one==two then next end
          slope = two.zip(one).map { |a, b| a - b }

          antinodes[freq] += explode(two, slope, limit)
          antinodes[freq] += explode(one, slope.map{|x|x*-1}, limit)
        }
      }
      antinodes.values.flatten(1).uniq.length
    end


    def part_1
      solve
    end

    def part_2
      solve(false)
    end
  end
end

executable = Y2024::Day08.new
executable.run