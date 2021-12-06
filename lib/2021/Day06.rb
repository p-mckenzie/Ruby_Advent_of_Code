require_relative '../Base.rb'

module Y2021
  class Day06 < Base
    @@day = 6
    @@year = 2021

    def initialize(data=get_data)
      @data = data.split(",").map(&:to_i)

      @fish = Hash.new(0)
      @data.each {|fish| @fish[fish] += 1}

      main

    end

    def time_passes
      next_fish = Hash.new(0)
      @fish.map { 
        |fish, count|
        if fish==0 then 
          next_fish[8] += count
          next_fish[6] += count
        else
          next_fish[(fish-1)] += count
        end
      }
      @fish = next_fish
    end

    def main
      80.times {time_passes}
      @part_1 = @fish.values.sum

      (256-80).times {time_passes}
      @part_2 = @fish.values.sum
    end

    def part_1
      @part_1
    end

    def part_2
      @part_2
    end  
  end
end

executable = Y2021::Day06.new
executable.run