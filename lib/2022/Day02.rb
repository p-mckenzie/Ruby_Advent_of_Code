require_relative '../Base'

module Y2022
  class Day02 < Base
    @@day = 2
    @@year = 2022

    def initialize(data=get_data)
      @data = data.split("\n").map {|row| row.split}.map{|x,y| [x.ord-65, y.ord-88]}
    end

    def beats(you)
      (you + 2) % 3
    end

    def win_points(opponent, you)
      if opponent == you then
        3
      elsif beats(you) == opponent
        6
      else
        0
      end
    end

    def move_choice(opponent, objective)
      case objective
      when 0
          return beats(opponent)
      when 1
          return opponent
      when 2
          return beats(beats(opponent))
      end
    end

    def part_1
      @data.map{|opponent, you| you + 1 + win_points(opponent, you)}.sum
    end

    def part_2
      @data.map(&:first).zip(@data.map{|opponent, you| move_choice(opponent, you)}).map {|opponent, you| you+1+win_points(opponent, you) }.sum
    end  
  end
end

executable = Y2022::Day02.new
executable.run