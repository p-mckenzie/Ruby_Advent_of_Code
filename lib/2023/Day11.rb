require_relative '../Base'

module Y2023
  class Day11 < Base
    @@day = 11
    @@year = 2023

    def initialize(data=get_data)
      @data = data.split("\n")

      @galaxies = []
      @data.each_with_index {
        |row, row_i|
        row.chars.each_with_index {
          |char, col_i|
          if char=='#' then
            @galaxies.push([row_i, col_i])
          end
        }
      }
    end

    def expand(galaxies: @galaxies.clone, axis: 0, by: 2)
      i = 0
      while i<galaxies.map {|arr| arr[axis]}.max do
        if galaxies.filter {|arr| arr[axis]==i}.empty? then
          #expand
          galaxies = galaxies.map {
            |arr|
            if arr[axis]>i then
              [arr.first + (by - 1) * ((axis+1) % 2), arr.last + (by - 1) * (axis % 2)]
            else 
              arr
            end  
          }
          i += by
        end
        i += 1
      end

      galaxies
    end

    def part_1
      galaxies = expand
      galaxies = expand(galaxies: galaxies, axis:1)
      galaxies.combination(2).map {
        |a,b|
        (a.first - b.first).abs + (a.last - b.last).abs
      }.sum
    end

    def part_2(by = 1000000)
      galaxies = expand(axis: 0, by: by)
      galaxies = expand(galaxies: galaxies, axis: 1, by: by)
      galaxies.combination(2).map {
        |a,b|
        (a.first - b.first).abs + (a.last - b.last).abs
      }.sum
    end
  end
end

executable = Y2023::Day11.new
executable.run
