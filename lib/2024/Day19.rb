require_relative '../Base'

module Y2024
  class Day19 < Base
    @@day = 19
    @@year = 2024

    def initialize(data=get_data)
      towels, patterns = data.split("\n\n")
      @towels = towels.split(", ")
      @patterns = patterns.split
      
      @map = { '' => 1 }
      @patterns.each { |pattern| find_feasible(@towels, pattern) }
    end

    def find_feasible(prefixes, pattern)
      return @map[pattern] if @map.include?(pattern)

      @map[pattern] = prefixes.map {
        |prefix| 
        pattern.start_with?(prefix) ? find_feasible(prefixes, pattern[prefix.length..]) : 0
      }.sum
    end

    def part_1
      @patterns.select { |pattern| @map[pattern] > 0}.length
    end

    def part_2
      @patterns.map { |pattern| @map[pattern] }.sum
    end
  end
end

executable = Y2024::Day19.new
executable.run