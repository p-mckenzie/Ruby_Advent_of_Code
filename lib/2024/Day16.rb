require_relative '../Base'

module Y2024
  class Day16 < Base
    @@day = 16
    @@year = 2024

    def initialize(data=get_data)
      @map = data.split.map{|row| row.split('')}

      @nrows = @map.length
      @ncols = @map.first.length

      @turn_cost = 1000
      
      (0...@nrows).each {
        |row|
        (0...@ncols).each {
          |col|
          if @map[row][col] == 'S'
            @start = [row, col]
          elsif @map[row][col] == 'E'
            @end = [row, col]
          end
        }
      }

      @directions = [[0,1], [1,0], [0,-1], [-1,0]]

      @dist_from_start = count_distances_from(@start)
      @dist_from_end = count_distances_from(@end)

      @min_cost = @dist_from_start[@end]
    end

    def print(locations)
      puts
      text = (0...@nrows).map {
        |row|
        (0...@ncols).map {
          |col|
          @map[row][col]
        }
      }

      locations.each {
        |row, col|
        text[row][col] = 'O'
      }

      puts text.map(&:join).join("\n")
    end

    def build_map(loc, dir_index, step_cost)
      dir = @directions[dir_index]

      step_loc = loc.zip(dir).map(&:sum)
      row, col = step_loc
      
      if @map[row][col] != '#'
        if @dist_from[step_loc] > @dist_from[loc] + step_cost
          @dist_from[step_loc] = @dist_from[loc] + step_cost

          build_map(step_loc, dir_index, 1)

          # turn 1 direction
          build_map(step_loc, (dir_index + 1) % 4, @turn_cost+1)

          # turn other direction
          build_map(step_loc, (dir_index - 1) % 4, @turn_cost+1)
        else
          return
        end
      end
    end

    def count_distances_from(point)
      @dist_from = Hash.new { |hash, key| hash[key] = @nrows * @ncols * @turn_cost }
      @dist_from[point] = 0

      build_map(point, 0, 1)
      build_map(point, 1, @turn_cost+1)
      build_map(point, 2, 2 * @turn_cost+1)
      build_map(point, 3, @turn_cost+1)

      @dist_from
    end

    def wander_until(loc, dir_index, path, cost_so_far)
      dir = @directions[dir_index]

      step_loc = loc.zip(dir).map(&:sum)
      row, col = step_loc

      if @map[row][col] == 'E' && @min_cost == cost_so_far
        path.push(step_loc)
        @best_paths.push(path.clone)
      elsif @map[row][col] != '#' && @min_cost >= cost_so_far + @dist_from_end[step_loc] - @turn_cost*2
        path.push(step_loc)

        wander_until(step_loc, dir_index, path.clone, cost_so_far + 1)

        # turn 1 direction
        wander_until(step_loc, (dir_index + 1) % 4, path.clone, cost_so_far + @turn_cost+1)

        # turn other direction
        wander_until(step_loc, (dir_index - 1) % 4, path.clone, cost_so_far + @turn_cost+1)
      else
        return
      end
    end

    def part_1
      @min_cost
    end

    def part_2
      @best_paths = []
      wander_until(@start, 0, [@start], 1)
      wander_until(@start, 1, [@start], @turn_cost+1)
      wander_until(@start, 2, [@start], 2 * @turn_cost+1)
      wander_until(@start, 3, [@start], @turn_cost+1)
      @best_paths.flatten(1).uniq.length
    end
  end
end

executable = Y2024::Day16.new
executable.run