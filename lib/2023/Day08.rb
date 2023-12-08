require_relative '../Base'

module Y2023
  class Day08 < Base
    @@day = 8
    @@year = 2023

    def initialize(data=get_data)
      instructions, nodes = data.split("\n\n")
      @instructions = instructions.chars

      @right = Hash.new
      @left = Hash.new

      nodes.split("\n").each {
        |line|
        node, left, right = line.scan(/[0-9A-Z]+/)
        @right[node] = right
        @left[node] = left
      }
    end

    def solve(start, filter)
      current = start
      targets = @left.keys.filter{|node| node.end_with?(filter)}
      distances = Hash.new { |h, k| h[k] = [] }

      steps = 0
      while true do
        instruction = @instructions[steps % @instructions.length]
        if instruction=='L' then
          current = @left[current]
        else
          current = @right[current]
        end
        steps += 1

        if targets.include?(current) then
          distances[current].push(steps.clone)
        end

        if distances.values.map {|x| x.length>=2}.all? && distances.length>0 then 
          break 
        end
      end
      distances
    end

    def part_1
      solved = solve('AAA', 'ZZZ')
      solved['ZZZ'].min
    end

    def part_2
      starting_points = @left.keys.filter{|node| node.end_with?('A')}

      distance_options = starting_points.map {
        |current|
        solve(current, 'Z')
      }.inject(&:merge)
            
      distance_options.map {|key,val| val[1] - val[0]}.reduce(1, :lcm)
    end
  end
end

executable = Y2023::Day08.new
executable.run
