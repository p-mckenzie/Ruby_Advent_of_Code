require_relative '../Base'

module Y2024
  class Day18 < Base
    @@day = 18
    @@year = 2024

    def initialize(data=get_data)
      @data = data.scan(/\d+/).map(&:to_i).each_slice(2).to_a

      @directions = [[0,1], [1,0], [0,-1], [-1,0]]
    end

    def setup(range, bytes)
      @grid = Hash.new
      range.each {
        |row|
        range.each {
          |col|
          @grid[[row,col]] = '.'
        }
      }

      @data[bytes].each {
        |loc|
        @grid[loc] = '#'
      }
    end

    def solve(range, bytes)
      setup(range, bytes)

      @seen = Hash.new
      locs = [[0, [0,0]]]
      loop do 
        score, loc = locs.pop
        if @seen[loc] && @seen[loc] <= score
          # pass
        else
          @seen[loc] = score
          @directions.each {
            |dir|
            step_loc = [loc.first+dir.first, loc.last+dir.last]
            if @grid[step_loc] && @grid[step_loc] != '#'
              locs.insert(0, [score+1, step_loc])
            end
          }
        end

        if locs.empty?
          break
        end
      end

      @seen[[range.max, range.max]]
    end

    def part_1(range=0..70, bytes=1024)
      solve(range, 0...bytes)
    end

    def part_2(range=0..70)
      # binary search
      left = 0
      right = @data.length
      loop do
        if solve(range, 0..(left+right)/2)
          left = (left+right)/2 + 1
        else
          right = (left+right)/2 - 1
        end

        if left>=right
          break
        end
      end
      @data[left].join(',')
    end
  end
end

executable = Y2024::Day18.new
executable.run