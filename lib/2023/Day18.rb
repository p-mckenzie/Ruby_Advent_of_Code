require_relative '../Base'

module Y2023
  class Day18 < Base
    @@day = 18
    @@year = 2023

    def initialize(data=get_data)
      @dir_map = {"R"=> [0, 1], "D"=> [1, 0], "L"=> [0, -1], "U"=> [-1, 0]}

      @data = data.split("\n").map {
        |line|
        dir, dist, color = line.split(" ")
        [dir, dist.to_i, color]
      }
    end

    def get_edges(inp)
      edges = []
      current = [0,0]
      total = 0

      edges.push(current)
      inp.each {
        |dir, dis|
        total += dis
        edges.push(@dir_map[dir].map{|e| e*dis}.zip(current).map(&:sum))
        current = edges.last
      }
      return edges, total
    end

    def shoelace(edges)
      edges.each_cons(2).map {|a,b| a.first*b.last - b.first*a.last}.sum.abs * 0.5
    end

    def solve(edges, boundary_points)
      # pick's theorem
      area = shoelace(edges)
      interior_points = (area + 1 - boundary_points/2).to_i
      boundary_points + interior_points
    end

    def part_1
      edges, boundary_points = get_edges(@data.map{|arr|arr[0..1]})
      solve(edges, boundary_points)
    end

    def part_2
      edges, boundary_points = get_edges(@data.map {
        |dir, dis, color|
        [@dir_map.keys[color[7].to_i], color[2..6].to_i(16)]
      })
      solve(edges, boundary_points)
    end  
  end
end

executable = Y2023::Day18.new
executable.run
