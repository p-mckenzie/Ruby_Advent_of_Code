require_relative '../Base'

module Y2024
  class Day03 < Base
    @@day = 3
    @@year = 2024

    def initialize(data=get_data)
      @locs = match_and_loc(data, /mul\(\d+,\d+\)/)
      @locs = @locs.map{|key,v| [key, v.scan(/\d+/).map(&:to_i).inject(&:*)]}.to_h

      @switches = match_and_loc(data, /don't\(\)|do\(\)/)
      @switches = @switches.map{|key,v| [key, v=='do()']}.to_h
      @switches[0] = true
    end

    def match_and_loc(text, regex)
      map = Hash.new
      i = 0

      text.scan(regex).each {
        |all|
        loc = text.index(all)
        map[loc + i] = all
        text = text[loc+all.length..]
        i += loc+all.length
      }
      map
    end

    def part_1
      @locs.values.sum
    end

    def part_2
      @locs.map{
        |loc, val| 
        near_switch = @switches.keys.select{|x|x<loc}.max
        if @switches[near_switch] then val else 0 end
        }.sum
    end  
  end
end

executable = Y2024::Day03.new
executable.run