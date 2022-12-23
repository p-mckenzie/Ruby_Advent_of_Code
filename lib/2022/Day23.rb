require_relative '../Base'

module Y2022
  class Day23 < Base
    @@day = 23
    @@year = 2022

    def initialize(data=get_data)
      @direction = 0
      @n_rounds = 0
      @elves = Hash.new {0}

      data.split("\n").each_with_index {
        |row, y|
        row.split('').each_with_index {
          |item, x|
          if item=='#' then
            @elves[[x,y]] = 1
          end
        }
      }
    end

    def wiggle(x,y)
      [
        #north
        {[x, y-1] => [[x-1, y-1], [x, y-1], [x+1, y-1]]},
        #south
        {[x, y+1] => [[x-1, y+1], [x, y+1], [x+1, y+1]]},
        #west
        {[x-1, y] => [[x-1, y-1], [x-1, y], [x-1, y+1]]},
        #east
        {[x+1, y] => [[x+1, y-1], [x+1, y], [x+1, y+1]]},
      ]
    end

    def propose(x,y)
      if (x-1..x+1).map {|inspect_x| (y-1..y+1).map {|inspect_y| @elves[[inspect_x, inspect_y]]}}.flatten.sum > 1 then
        guide = wiggle(x,y).map {|direction| direction.map{|target, inspect| [target, inspect.map{|inspect_x, inspect_y| @elves[[inspect_x, inspect_y]]}.sum]}}.flatten(1)
        (guide[@direction..] + guide[0...@direction]).each {
          |target, contents|
          if contents==0 then 
            return target
          end
        }
      end
      [x,y]
    end

    def round
      @n_rounds += 1

      proposes = @elves.map {|key, val| [key, propose(*key)]}.to_h
      
      final = Hash.new {0}
      proposes.group_by{|key,val| val}.map {|key, vals| [key,vals.map(&:first)]}.to_h.each {
        |destination, elves|
        if elves.length==1 then
          # move one to destination
          final[destination] = 1
        else
          # leave them all in place
          elves.each {|elf| final[elf] = 1}
        end
      }
      @moving = @elves.keys != final.keys
      @elves = final.clone
      @direction = (@direction + 1) % 4   
    end

    def part_1
      while @n_rounds<10 do
        round
      end
      
      width = @elves.keys.map(&:first).minmax.reduce{|a,b| b-a} + 1
      height = @elves.keys.map(&:last).minmax.reduce{|a,b| b-a} + 1
      width * height - @elves.length
    end

    def part_2
      @moving = true
      while @moving do
        @moving = false
        round
      end
      @n_rounds
    end  
  end
end

executable = Y2022::Day23.new
executable.run