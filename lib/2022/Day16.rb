require_relative '../Base'

module Y2022
  class Valve
    attr_accessor :name, :flow_rate, :neighbors, :distances
    def initialize(name:, flow_rate:, neighbors: [])
      @name = name
      @flow_rate = flow_rate
      @neighbors = neighbors
      @distances = Hash.new
    end

    def inspect
      "#{@name}"
    end
  end
  
  class Day16 < Base
    @@day = 16
    @@year = 2022

    def initialize(data=get_data)
      @valves = data.split("\n").map {
        |entry|
        names = entry.scan(/[A-Z]{2}/)
        flow_rate = entry.scan(/[\d]+/).first.to_i
        Valve.new(name: names[0], neighbors: names[1..], flow_rate: flow_rate)
      }

      # reset neighbors to pointers, rather than just string names
      @valves.each do
        |valve|
        valve.neighbors = valve.neighbors.map{|neighbor| @valves.find{|a| a.name == neighbor}}
      end

      # for each valve, calculate its distance to every other valve
      @valves.each do 
        |valve|
        distances = Hash.new( @valves.length )
        distances[valve] = 0
        valve.distances = measure_distance(valve, distances)
      end

      @head = @valves.find{|a| a.name =='AA'}
    end

    def measure_distance(node, distances)
      node.neighbors.each do
        |neighbor|
        if distances[neighbor] > distances[node] + 1 then
          distances[neighbor] = distances[node] + 1
          distances = measure_distance(neighbor, distances)
        end
      end
      distances
    end

    def find_all_possible_paths(current_valve:, open_valves: [], time_left:30)
      @valves.select{|valve| valve.flow_rate > 0}.each do
        |valve|
        if !open_valves.include?(valve) and current_valve.distances[valve] < time_left then
          open_valves.append(valve)
          find_all_possible_paths(current_valve: valve, open_valves: open_valves, time_left: time_left - current_valve.distances[valve] - 1)
          open_valves.pop()
        end
      end
      @paths.append(open_valves.clone)
    end

    def walk_path(path, time_left=30)
      pressure_released = 0
      current = @head
      path.each do
        |target|
        time_left -= current.distances[target] + 1
        pressure_released += target.flow_rate * time_left
        current = target
      end
      pressure_released
      end

    def part_1
      @paths = []
      find_all_possible_paths(current_valve: @valves.first)

      @paths.map{|path| walk_path(path)}.max
    end

    def part_2
      @paths = []
      find_all_possible_paths(current_valve: @valves.first, time_left: 26)

      # find unique sets of visited valves, and
      # assume we'd take the optimal path to reach them
      optimal_arrangement = Hash.new(0)
      @paths.map{
        |path| 
        arrangement = path.sort_by(&:name)
        optimal_arrangement[arrangement] = [walk_path(path, time_left=26), optimal_arrangement[arrangement]].max
      }

      optimal_arrangement = optimal_arrangement.to_a

      # for each human, elephant combination, check that the paths do not overlap
      # then log the sum of pressure released
      (0...optimal_arrangement.length).map do
        |human|
        human_path, human_score = optimal_arrangement[human]

        (human+1...optimal_arrangement.length).map do
          |elephant|
          elephant_path, elephant_score = optimal_arrangement[elephant]

          if (elephant_path & human_path).empty? then
            human_score+elephant_score
          end
        end.compact
      end.flatten.max
    end
  end
end

executable = Y2022::Day16.new
executable.run
