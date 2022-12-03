require_relative '../Base'

module Y2022
  class Day03 < Base
    @@day = 3
    @@year = 2022

    def initialize(data=get_data)
      @data = data.split
    end

    def score(char)
      char.ord - 96 + (if char == char.upcase then 58 else 0 end)
    end

    def reduce(arr)
      arr.map{|group| score(group.inject(:&).first)}.sum
    end

    def part_1
      half_bags = @data.map {|entry| [entry[0..entry.length / 2 - 1].split(''), entry[entry.length / 2 ..].split('')]}
      reduce(half_bags)
    end

    def part_2
      elf_groups = (@data.length / 3).times.map{|i| @data[i*3..i*3+2].map {|elf| elf.split('')} }
      reduce(elf_groups)
    end  
  end
end

executable = Y2022::Day03.new
executable.run