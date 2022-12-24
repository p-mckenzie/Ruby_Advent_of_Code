require_relative '../Base'

module Y2022
  class Storm
    attr_reader :location, :token
    def initialize(token, location, xmax, ymax)
      @token = token
      @location = location
      @xmax = xmax
      @ymax = ymax
      @movement = case token
      when '^'
        [0, -1]
      when 'v'
        [0, 1]
      when '>'
        [1, 0]
      when '<'
        [-1, 0]
      end
    end

    def tick
      x, y = [@location, @movement].transpose.map(&:sum)
      
      x = x>=@xmax ? 1 : x
      y = y>=@ymax ? 1: y

      x = x<=0 ? @xmax - 1 : x
      y = y<=0 ? @ymax - 1: y
      @location = [x,y]
    end

    def inspect
      "<Storm #{@token} at #{@location.join(':')}>"
    end
  end

  class Day24 < Base
    @@day = 24
    @@year = 2022

    def initialize(data=get_data)
      lines = data.split("\n")
      @ylength = lines.length
      @xlength = lines[0].length

      @map = []
      
      lines.each_with_index {
        |line, y|
        line.split("").each_with_index{
          |char, x|
          if y==0 and char=='.' then
            @start = [x,y]
          elsif y==@ylength-1 and char=='.' then
            @end = [x,y]
          end
          if char=='.' or char=='#' then
            next
          end

          @map.append(Storm.new(char, [x,y], @xlength-1, @ylength-1))
        }
      }
      @time = 0
      walk_map(@start, @end)
    end

    def wiggle(x,y)
      [
        [x, y],
        [x+1, y],
        [x-1, y],
        [x, y+1],
        [x, y-1],
      ]
    end

    def manhattan(x,y, target)
      (target[0] - x).abs + (target[1] - y).abs
    end

    def walk_map(start, goal)
      options = [start]

      loop do 
        # updates states
        @map.each(&:tick)
        @time += 1

        occupied_positions = @map.map(&:location)
        next_options = []

        options.each {
          |position|
          # update position (to wherever is open and close enough)
          wiggle(*position).each {
            |new_pos|
            if new_pos==goal then
              # win!
              return
            elsif new_pos==start then
              # always able to return to start
              next_options.append(new_pos)
              next
            end


            if new_pos[0]<=0 or new_pos[1]<=0 or new_pos[0]>=@xlength-1 or new_pos[1]>=@ylength-1 then
              next
            end

            if !occupied_positions.include?(new_pos) then
              next_options.append(new_pos)
            end
          }
        }
        options = next_options.uniq
        if options.length > 50 then
          options = options.sort_by {|x,y| manhattan(x,y, goal)}.first(50)
        end
      end
    end

    def part_1
      @time
    end

    def part_2
      walk_map(@end, @start)
      walk_map(@start, @end)
      @time
    end  
  end
end

executable = Y2022::Day24.new
executable.run