require_relative '../Base'

module Y2022
  class Day05 < Base
    @@day = 5
    @@year = 2022

    def initialize(data=get_data)
      layout, moves = data.split("\n\n").map{|l| l.split("\n")}
      
      @start = (0...layout[0].length).map {|i| layout.map {|line| line[i] unless line[i].strip.empty?}.compact}.select {|lst| Float(lst[-1]) != nil rescue false}
      @moves = moves.map {|move| move.scan(/\d+/).map(&:to_i)}
    end

    def move_crates(reverse=true)
      layout = Hash[@start.clone.collect {|arr| [arr[-1].to_i, arr[0...-1].reverse]}]
      
      @moves.each do
        |qty, origin, destination|

        loc = [0, layout[origin].length-qty].max

        stack = layout[origin][loc..]
        if reverse then 
          stack = stack.reverse 
        end

        layout[destination].append(*stack)
        layout[origin] = layout[origin][0...loc]
      end
      layout.values.map(&:last).join
    end

    def part_1
      move_crates()
    end

    def part_2
      move_crates(reverse=false)
    end
  end
end

executable = Y2022::Day05.new
executable.run