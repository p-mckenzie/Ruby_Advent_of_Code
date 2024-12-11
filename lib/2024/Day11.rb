require_relative '../Base'

module Y2024
  class Day11 < Base
    @@day = 11
    @@year = 2024

    def initialize(data=get_data)
      @stones = data.split.map(&:to_i).tally
    end

    def num_digits(num)
      size = 0
      while num > 0 do
        size += 1
        num /= 10
      end
      size
    end

    def blink(stones)
      new_stones = Hash.new { |hash, key| hash[key] = 0 }
      stones.each {
        |num, qty|
        digits = num_digits(num)

        if num==0
          new_stones[1] += qty
        elsif digits % 2 == 0
          split_index = Math.log10(num).floor / 2 + 1

          new_stones[num / (10 ** split_index)] += qty
          new_stones[num % (10 ** split_index)] += qty
        else
          new_stones[num * 2024] += qty
        end
      }
      new_stones
    end

    def solve(n=25)
      stones = @stones.clone

      n.times do
        stones = blink(stones)
      end
      stones.values.sum
    end

    def part_1
      solve
    end

    def part_2
      solve(n=75)
    end
  end
end

executable = Y2024::Day11.new
executable.run