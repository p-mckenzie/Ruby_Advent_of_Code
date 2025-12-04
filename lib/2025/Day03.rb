require_relative '../Base'

module Y2025
  class Day03 < Base
    @@day = 3
    @@year = 2025

    def initialize(data=get_data)
      @data = data.split.map{|line| line.chars.map(&:to_i)}
    end

    def solve(bank, digits)
      idx = 0
      (digits-1).downto(0).map {
        |digit|
        arr = bank[idx...(bank.size - digit)]
        val = arr.max
        idx = idx + 1 + arr.index(val)

        val * 10 ** digit
      }.sum
    end

    def part_1
      @data.map {
        |bank|
        solve(bank, 2)
      }.sum
    end

    def part_2
      @data.map {
        |bank|
        solve(bank, 12)
      }.sum
    end  
  end
end

executable = Y2025::Day03.new
executable.run