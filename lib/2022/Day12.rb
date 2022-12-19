require_relative '../Base'
require 'networkx'

module Y2022
  class Day12 < Base
    @@day = 12
    @@year = 2022

    def initialize(data=get_data)
      @map = data.split.map{|row| row.split('')}

      @xlength = @map.length
      @ylength = @map[0].length

      @graph = NetworkX::DiGraph.new

      (0...@xlength).each {
        |x|
        (0...@ylength).each {
          |y|
          height = get_height(x,y)
          neighbors(x,y).each {
            |neighbor|
            neighbor_height = get_height(*neighbor)
            if (neighbor_height.ord - height.ord) < 2 then
              @graph.add_edge([x,y], neighbor)
            end
          }
        }
      }
    end

    def get_height(x,y)
      current_height = @map[x][y]
      if current_height=='S' then 
        @start = [x,y]
        return 'a'
      elsif current_height=='E' then 
        @end = [x,y]
        return 'z'
      end
      current_height
    end

    def neighbors(x,y)
      [
        if x+1<@xlength then [x+1, y] end,
        if y+1<@ylength then [x, y+1] end,
        if x-1>=0 then [x-1, y] end,
        if y-1>=0 then [x, y-1] end,
        ].compact
    end

    def part_1
      NetworkX.bellmanford_path_length(@graph, @start, @end)
    end

    def part_2
      (0...@xlength).map {
        |x|
        (0...@ylength).map {
          |y|
          if get_height(x,y)=='a' then
            begin
              NetworkX.dijkstra_path_length(@graph, [x,y], @end)
            rescue
              next 
            end
          end
        }
      }.flatten.compact.min
    end  
  end
end

executable = Y2022::Day12.new
executable.run