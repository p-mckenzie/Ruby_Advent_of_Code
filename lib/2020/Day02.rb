require_relative '../Base.rb'
require 'enumerator'

module Y2020
  class Day02 < Base
    @@day = 2
    @@year = 2020

    def initialize(data=get_data)
      @data = data.split

      @num_valid_1 = 0
      @num_valid_2 = 0

      main
    end

    def main
      @data.each_slice(3).each { |rng, token, pswd|

        # remove hyphen
        token = token[0..-2]

        # convert range to integer values
        rng = rng.split('-').map(&:to_i)
        # number of occurrences of token in pswd
        cnt = pswd.scan(token).length

        # pt 1 is valid if count is within the range
        if cnt>=rng[0] and cnt<=rng[1] then 
          @num_valid_1 += 1 
        end

        # pt 2 is valid if token appears at only one of the rng locations
        if ((pswd[rng[0]-1]==token) ^ (pswd[rng[1]-1]==token)) then
          @num_valid_2 += 1
        end
        
      }
    end

    def part_1
      @num_valid_1
    end

    def part_2
      @num_valid_2
    end  
  end
end

executable = Y2020::Day02.new
executable.run