require_relative '../Base'

module Y2022
  class Day19 < Base
    @@day = 19
    @@year = 2022

    @@cutoff = 24
    @@guide = ['geode', 'obsidian', 'clay', 'ore']

    def initialize(data=get_data)
      @blueprints = data.split("\n").map { |line|
        line.split('.').map { 
          |s|
          costs = [0, 0, 0, 0]
          s.split('costs').last.split(' and ').each { 
            |s|
            num, type = s.split(' ')
            costs[@@guide.index(type)] = -num.to_i
          }
          costs
        }.reverse
      }
    end

    def geodes_after(blueprint, times=24)
      start_robots = [0,0,0,1]
      start_ore = [0,0,0,0]
      states = [[start_ore, start_robots]]

      times.times do
        next_states = []
        states.each {
          |ore, robots|
          # produce any robots you can afford
          blueprint.each_with_index {
            |robot_costs, i|
            ore_after_building = robot_costs.zip(ore).map(&:sum)
            if ore_after_building.none?(&:negative?)
              new_robots = robots.clone
              new_robots[i] += 1
              next_states.push [ore_after_building.zip(robots).map(&:sum), new_robots]
            end
          }
          # just produce ore
          next_states.push [ore.zip(robots).map(&:sum), robots]
        }

        states = next_states.uniq.max_by(5000) {|ore, robots| ore.zip(robots).flatten }
      end
      states.max.first.first
    end

    def part_1
      @blueprints.each_with_index.map {|blueprint, i| (i+1) * geodes_after(blueprint)}.sum
    end

    def part_2
      @blueprints[0..2].map {|blueprint| geodes_after(blueprint, 32)}.inject(:*)
    end
  end
end

executable = Y2022::Day19.new
executable.run