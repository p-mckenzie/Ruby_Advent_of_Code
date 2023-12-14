require_relative '../Base'

module Y2023
  class Day13 < Base
    @@day = 13
    @@year = 2023

    def initialize(data=get_data)
      @patterns = data.split("\n\n").map {
        |chunk|
        chunk.split("\n").map(&:chars)
      }
    end

    def count_matches(a, b)
      height = [a.length, b.length].min
      width = a.first.length
      matches = (0...height).map {
          |j|
          (0...width).map{|k| a[j][k] == b[j][k] ? 1 : 0}
      }

      [height * width, matches.flatten.sum]
    end

    def reflect(pattern, offset=0)
      # horizontal line
      (1...pattern.length).map {
        |i|
        top = pattern[0...i].reverse
        bottom = pattern[i...pattern.length]

        range, match_count = count_matches(top, bottom)

        if range-offset == match_count then
          return i
        end
      }
      0
    end

    def part_1
      @patterns.map {
        |pattern|
        100 * reflect(pattern) + reflect(pattern.transpose)
      }.sum
    end

    def part_2
      @patterns.map {
        |pattern|
        100 * reflect(pattern, 1) + reflect(pattern.transpose, 1)
      }.sum
    end
  end
end

executable = Y2023::Day13.new
executable.run
