require_relative '../Base'

module Y2025
  class Day05 < Base
    @@day = 5
    @@year = 2025

    def initialize(data=get_data)
      fresh, available = data.split("\n\n")

      @fresh = fresh.split.map{
        |line| 
        Range.new(*line.split('-').map(&:to_i))
      }
      @available = available.split.map(&:to_i)
    end

    def part_1
      @available.filter_map{
        |i| 
        valid = false
        @fresh.each {
          |range|
          if range.include?(i)
            valid = true
            break
          end
        }
        valid
      }.size
    end

    def condense(ranges)
      condensed_ranges = []
      ranges.each {
        |range|
        new_range = nil
        condensed_ranges.each_with_index {
          |possible_overlap,i|
          if range.min <= possible_overlap.max && range.max >= possible_overlap.min then
            min = [range.min, possible_overlap.min].min
            max = [range.max, possible_overlap.max].max

            new_range = min..max
            condensed_ranges[i] = new_range
            break
          end
        }
        unless new_range
          condensed_ranges.append(range)
        end
      }
      condensed_ranges
    end

    def part_2
      ranges = @fresh

      loop do
        size = ranges.size
        ranges = condense(ranges)
        break if ranges.size==size
      end

      ranges.map(&:size).sum
    end  
  end
end

executable = Y2025::Day05.new
executable.run