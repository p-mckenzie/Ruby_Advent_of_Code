require_relative '../Base'

module Y2024
  class Day02 < Base
    @@day = 2
    @@year = 2024

    def initialize(data=get_data)
      @data = data.split("\n").map{|arr| arr.split.map(&:to_i)}
    end

    def safe(arr)
      diff = arr.each_cons(2).map {|a, b|b - a}
        
      sign_match = (diff.map(&:positive?).all? | diff.map(&:positive?).none?)
      scale = (diff.map(&:abs).max <= 3) & (diff.map(&:abs).min >= 1)

      sign_match & scale
    end

    def part_1
      @data.map{|arr| safe(arr)}.count(true)
    end

    def part_2
      @data.map{
        |arr| 
        (0...arr.length).map {|k| safe(arr[0...k] + arr[k+1..arr.length])}.any?
    }.count(true)
    end  
  end
end

executable = Y2024::Day02.new
executable.run