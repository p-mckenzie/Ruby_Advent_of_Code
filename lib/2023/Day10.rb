require_relative '../Base'

module Y2023
  class Day10 < Base
    @@day = 10
    @@year = 2023

    def initialize(data=get_data)
      @dir_map = {"|"=> Proc.new{|arr| arr.zip([1, 0]).map { |x| x.inject(&:*) } }, 
                  "-"=> Proc.new{|arr| arr.zip([0, 1]).map { |x| x.inject(&:*) } }, 
                  "L"=> Proc.new{|arr| arr.zip([-1, 1]).map(&:sum) }, 
                  "J"=> Proc.new{|arr| arr.zip([-1, -1]).map(&:sum) },
                  "7"=> Proc.new{|arr| arr.zip([1, -1]).map(&:sum) },
                  "F"=> Proc.new{|arr| arr.zip([1, 1]).map(&:sum) },
                  '.'=> Proc.new{|arr| arr },
                }

      @data = data.split("\n").map(&:chars)
      @col_dim = @data.length
      @row_dim = @data.first.length

      @start = [data.index('S') / (@col_dim + 1), data.index('S') % (@row_dim + 1)]
      
      @loops = [[0,1], [1,0], [-1,0], [0,-1]].map {
        |dir|
        walk(dir, @start)
      }.compact.first
    end

    def walk(dir, start)
      current = start
      current_dir = dir
      path = [current]
      while true do
        # step forward
        next_space = current_dir.zip(current).map(&:sum)

        # invalid location: we walked off the map!
        if next_space.min<0 or (next_space.first>=@col_dim) or (next_space.last>=@row_dim) then
          return 
        end

        # turn accordingly
        symbol = @data[next_space.first][next_space.last]
        if symbol=='S' then 
          return path 
        end
        new_dir = @dir_map[symbol].call(current_dir)

        # invalid pipe to enter
        if new_dir.sum.abs!=1 then 
          return 
        end

        current_dir = new_dir
        current = next_space
        path.push(current)
      end
    end

    def part_1
      @loops.length / 2
    end

    def shoelace(edges)
      edges.each_cons(2).map {|a,b| a.first*b.last - b.first*a.last}.sum.abs * 0.5
    end

    def solve(edges)
      # pick's theorem
      area = shoelace(edges)
      boundary_points = edges.length - 1
      (area + 1 - boundary_points/2).to_i
    end

    def part_2
      @loops.push(@start)
      solve(@loops)
    end  
  end
end

executable = Y2023::Day10.new
executable.run
