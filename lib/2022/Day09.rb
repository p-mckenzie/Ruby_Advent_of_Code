require_relative '../Base'

module Y2022
  class Day09 < Base
    @@day = 9
    @@year = 2022

    def initialize(data=get_data)
      @moves = data.split("\n").map(&:split).map{|dir, x| [dir, x.to_i]}
    end

    def already_adjacent(head, tail)
      head.zip(tail).map { |a, b| a - b }.map(&:abs).max <= 1
    end

    def update_follower(head, tail)
      if already_adjacent(head, tail) then return end

      [0,1].each do 
        |i|
        if head[i] > tail [i] then
        tail[i] += 1
        elsif head[i] < tail[i]
          tail[i] -=1
        end
      end
    end

    def update_position(ropes, dir, x)
      x.times do
        case dir
        when 'R'
          ropes[0][0] += 1
        when 'L'
          ropes[0][0] -= 1
        when 'D'
          ropes[0][1] -= 1
        when 'U'
          ropes[0][1] += 1
        end
        (ropes.length-1).times do 
          |i| 
          update_follower(ropes[i], ropes[i+1])
        end

        @tail_visits.append(ropes[-1].clone)
      end
    end

    def follow_tails(n)
      ropes = (0...n).map{|x| [0,0]}

      @tail_visits = [ropes[-1].clone]

      @moves.each do 
        |move|
        update_position(ropes, *move)
      end

      @tail_visits.uniq.length
    end

    def part_1
      follow_tails(2)
    end

    def part_2
      follow_tails(10)
    end
  end
end

executable = Y2022::Day09.new
executable.run