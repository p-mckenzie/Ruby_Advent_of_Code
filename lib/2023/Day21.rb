require_relative '../Base'
require 'byebug'

module Y2023
  class Day21 < Base
    @@day = 21
    @@year = 2023

    def initialize(data=get_data)
      @map = data.split("\n").map(&:chars)
      @col_dim = @map.length
      @row_dim = @map.first.length

      @start = [data.index('S') / (@col_dim + 1), data.index('S') % (@row_dim + 1)]
    end

    def garden?(loc)
      ['.', 'S'].include?(@map[loc.first][loc.last])
    end

    def step(locs, proc)
      output = Set.new
      locs.each {
        |loc|
        [[0,1], [1,0], [-1,0], [0,-1]].each {
          |movement|
          new_loc = movement.zip(loc).map(&:sum)
          if garden?(new_loc.map{|x| proc.call(x)}) then
            output.add(new_loc)
          end
        }
      }
      output
    end

    def part_1(steps=64)
      path = Hash.new{|h,k| h[k] = Set.new }
      path[0].add(@start)
      proc = Proc.new{|x| x}

      (1..steps).each {
        |i|
        path[i] = step(path[i-1], proc)
      }

      path[steps].length
    end

    def part_2(steps=16)
      path = Hash.new{|h,k| h[k] = Set.new }
      path[0].add(@start)
      proc = Proc.new{|x| x % @col_dim}

      (1..(@col_dim / 2 + @col_dim * 2)).each {
        |i|
        path[i] = step(path[i-1], proc)
      }
      
      # ax^2 + bx + c = y
      c = path[@col_dim / 2].length # x=0
      y1 = path[@col_dim / 2 + @col_dim].length #x=1
      y2 = path[@col_dim / 2 + @col_dim*2].length #x=2

      # a + b + c = y1
      # 4a + 2b + c = y2
      # 2a - c = y2 - 2*y1
      # a = (y2 - 2*y1 + c) / 2

      a = (y2 - 2*y1 + c ) / 2
      b = y1 - a - c

      # note that 26501365 = 202300 * 131 + 65 where 131 is the dimension of the grid
      n = 202300
      a * n * n + b * n + c
    end
  end
end

executable = Y2023::Day21.new
executable.run
