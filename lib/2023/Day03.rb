require_relative '../Base'
require 'byebug'

module Y2023
  class Day03 < Base
    @@day = 3
    @@year = 2023

    def initialize(data=get_data)
      @data = data.split("\n")

      @xlength = @data.length
      @ylength = @data[0].length

      # prepare data into hashes of (row, col) => value
      @number_locs = Hash.new
      @symbol_locs = Hash.new

      @data.each_with_index {
        |line, row|
        col = 0

        numbers = line.scan(/[0-9]+/)
        number_idx = 0
        number = numbers[number_idx]
        while (col<@ylength) do
          char = line[col]
          if number then
            # check to see if number starts here
            if line[col...col+number.length]==number then
              @number_locs[[row, col]] = number
              col += number.length
              number_idx += 1
              number = numbers[number_idx]
              next
            end
          end

          # check to see if it's a symbol and log if necessary
          unless char.match(/[0-9]+/) or char=='.' then
            @symbol_locs[[row, col]] = char
          end

          col += 1
        end
      }

      # iterate through numbers, finding adjacent symbols and logging
      
      # ratios tracks all numbers next to a given symbol point
      @ratios = Hash.new{|h,k| h[k] = [] }

      # adjacents tracks numbers that have at least one symbol adjacent
      @adjacents = @number_locs.filter {
        |idx, number|
        row, col = idx

        ([row-1, 0].max..[row+1, @xlength-1].min).map {
          |r|
          ([col-1, 0].max..[col+number.length, @ylength-1].min).map {
            |s|
            if @symbol_locs.keys.include?([r,s]) then
              @ratios[[r,s]].push(number)
            end
          }.any?
        }.any?
      }
    end

    def part_1
      @adjacents.values.map(&:to_i).sum
    end

    def part_2
      @ratios.map{
        |key, values| 
        if values.length==2 and @symbol_locs[key]=='*' then
          values.map(&:to_i).inject(:*)
        end
      }.compact.sum
    end  
  end
end

executable = Y2023::Day03.new
executable.run
