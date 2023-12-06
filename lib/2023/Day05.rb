require_relative '../Base'

module Y2023
  class SeedState
    attr_accessor :range, :state
  
    def initialize(range, state='seed')
      @range = range
      @state = state
    end

    def done?
      @state == 'location'
    end
  end

  class Day05 < Base
    @@day = 5
    @@year = 2023

    def initialize(data=get_data)
      data = data.split("\n\n")
      @seeds = data[0].scan(/[0-9]+/).map(&:to_i)

      # map [origin, target] to the ranges
      @data = Hash.new

      data[1..].map{
        |chunk|
        lines = chunk.split("\n")
        name = lines.first.split(" ").first.split("-to-")
        @data[name] = lines[1..].map{
          |line|
          line.split.map(&:to_i)
        }
      }
    end

    def zoom_in(seed)
      if seed.done? then
        return seed
      end
      
      guide, ranges = @data.filter{|key, val| key.first==seed.state}.first
      next_state = guide.last

      ranges.each {
        |dest, src, len|

        # find overlap
        left = [src, seed.range.min]
        right = [src+len - 1, seed.range.max]
        overlap = right.min - left.max + 1
        
        if overlap>0 then
          return [

          # chunk to the left of overlap
          if seed.range.min<left.max then
            SeedState.new(seed.range.min..left.max-1, seed.state)
          end,

          # overlap
          SeedState.new((left.max + (dest - src))..(right.min + (dest - src)), next_state),

          # chunk to the right of overlap
          if seed.range.max>right.min then
            SeedState.new(right.min+1..seed.range.max, seed.state)
          end].compact
        end
      }

      # if there wasn't any overlap, move seeds as-is to next state
      return [SeedState.new(seed.range, next_state)]
    end

    def run_seeds(seeds)
      while not seeds.map(&:done?).all? do
        seeds = seeds.map{|seed| zoom_in(seed)}.flatten
      end
      seeds.map {|seed| seed.range.min}.min
    end

    def part_1
      seeds = @seeds.map {
        |seed|
        SeedState.new(seed..seed)
    }
      run_seeds(seeds)
    end

    def part_2
      seeds = @seeds.each_slice(2).map {
          |start, len|
          SeedState.new(start..start+len-1)
      }
      run_seeds(seeds)
    end
  end
end

executable = Y2023::Day05.new
executable.run
