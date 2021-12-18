require_relative '../Base.rb'

module Y2021
  class Day15 < Base
    @@day = 15
    @@year = 2021

    def initialize(data=get_data)
      initial_board = data.split.map {|row| row.split('').map(&:to_i)}
      xlength = initial_board.length
      ylength = initial_board[0].length

      @factor = 5

      # store the offset tile pieces to create larger board
      @tiles = Hash.new
      @tiles[0] = initial_board

      (1..10).each {
        |i|
        @tiles[i] = @tiles[i-1].map{|row|row.map{|x| x+1<10? (x+1) : 1}}
      }

      @board = (0...@factor).map {
        |x|
        row = (0...@factor).map {|y| @tiles[x+y]}
        (0...ylength).map {|position| row.map{|element|element[position]}.inject(&:+)}
      }.flatten(1)

      @xlength = @board.length
      @ylength = @board[0].length

      find_distances

    end

    def neighbors(x,y)
      [
        if x+1<@xlength then [x+1, y] end, #bottom
        if y-1>=0 then [x, y-1] end, #left
        if x-1>=0 then [x-1, y] end, #top
        if y+1<@ylength then [x, y+1] end, #right
      ]
    end

    def find_distances
      initial = [0,0]

      @distances = Hash.new
      @distances[initial] = 0

      processing = [initial]

      while processing.length > 0 do
        next_to_process = []

        processing.each {
          |current_node|
          current_risk_level = @distances[current_node]
          neighbors(*current_node).compact.each {
            |current|
            # check each neighbor, 
            step_risk_level = @board[current[0]][current[1]]
            if not @distances[current] then 
              # use existing least risky path plus step
              next_to_process << current
              @distances[current] = current_risk_level + step_risk_level
            elsif (current_risk_level + step_risk_level) < @distances[current] then
              # new least risky path on previously found node
              # update it's neighbors too
              next_to_process << current
              @distances[current] = current_risk_level + step_risk_level
            end
          }
        }
        processing = next_to_process.uniq
      end
      
    end

    def part_1
      @distances[[@xlength/@factor-1, @ylength/@factor-1]]
    end

    def part_2
      @distances[[@xlength-1, @ylength-1]]
    end  
  end
end

executable = Y2021::Day15.new
executable.run