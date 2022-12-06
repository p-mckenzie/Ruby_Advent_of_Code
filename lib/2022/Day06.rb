require_relative '../Base'
require 'byebug'

module Y2022
  class Day06 < Base
    @@day = 6
    @@year = 2022

    def initialize(data=get_data)
      @inp = data.strip.split('')
    end

    def detect(len)
      (len-1..@inp.length).each do 
        |i|
          return i + 1 if @inp[i-len+1..i].uniq.length == len
      end
    end

    def part_1
      detect(4)
    end

    def part_2
      detect(14)
    end
  end
end

executable = Y2022::Day06.new
executable.run