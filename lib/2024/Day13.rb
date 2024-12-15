require_relative '../Base'

module Y2024
  class Day13 < Base
    @@day = 13
    @@year = 2024

    def initialize(data=get_data)
      @prizes = data.split("\n\n").map{|prize| prize.scan(/\d+/).map(&:to_f)}
    end

    def close_enough(val)
      ([val, val.round].max - [val, val.round].min) < 0.001
    end

    def solve(prize)
      a1, a2, b1, b2, c1, c2 = prize

      # a1 * x + b1 * y = c1
      # a2 * x + b2 * y = c2

      # a2 * a1/a2 * x + b2 * a1/a2 * y = c2 * a1/a2
      # a1 * x + b2 * a1/a2 * y = c2 * a1/a2

      # b1 * y - b2 * a1/a2 * y = c1 - c2 * a1/a2
      y = (c1 - c2 * a1/a2) / (b1 - b2 * a1/a2)
      x = (c1 - b1 * y) / a1

      if close_enough(x) && close_enough(y)
        3 * x.round + y.round
      else
        0
      end
    end

    def part_1
      @prizes.map {|prize| solve(prize)}.sum
    end

    def part_2
      @prizes.map {
        |prize|
        prize = prize.clone
        prize[4] += 10000000000000
        prize[5] += 10000000000000

        solve(prize)
    }.sum
    end
  end
end

executable = Y2024::Day13.new
executable.run