require_relative '../Base'

module Y2024
  class Day15 < Base
    @@day = 15
    @@year = 2024

    def initialize(data=get_data)
      @map, pattern = data.split("\n\n")
      @pattern = pattern.chars

      @nrows = @map.split.length
      @ncols = @map.split.first.length

      @directions = {"v" => [1,0], "^" => [-1,0], ">" => [0,1], "<" => [0,-1]}
    end

    def print(locations, walls)
      puts
      text = (0...@nrows).map {
        |row|
        (0...@ncols).map {
          |col|
          '.'
        }
      }

      locations.each_with_index {
        |val, index|
        row, colrange = val
        if colrange.size==1
          text[row][colrange.min] = index==0 ? '@' : 'O'
        elsif colrange.size==2
          text[row][colrange.min] = '['
          text[row][colrange.max] = ']'
        end
      }

      walls.each {
        |row, col|
          text[row][col] = '#'
      }
      puts text.map(&:join).join("\n")
    end

    def push(locations, walls)
      @pattern.each {
        |char|
        dir = @directions[char]
        unless dir then next end

        moving = [0]
        new_locations = locations.clone

        loop do
          moving = moving.map {
            |i|
            # move current
            row, colrange = [locations[i].first + dir.first, locations[i].last.min + dir.last .. locations[i].last.max + dir.last]
            new_locations[i] = [row, colrange]

            # check to see if anything else needs to get bumped
            relevant_boxes = locations.select{|boxr, boxc| boxr==row && boxc.overlap?(colrange)}
            relevant_boxes.map {
              |relevant_box|
              relevant_index = locations.index(relevant_box)
              if relevant_index && locations[relevant_index]==new_locations[relevant_index]
                locations.index(relevant_box)
              else
                nil
              end
            }
          }.flatten.compact.uniq

          if moving.empty?
            break
          end
        end

        if new_locations.map {
          |row, colrange|
          colrange.map {
            |col|
            walls.include?([row, col])
          }.any?}.any?
          # any collision means step is invalid
          next
        else
          locations = new_locations
        end
      }
      locations[1..].map {|row, colrange| 100 * row + colrange.min}.sum
    end


    def part_1
      locations = [] # movable things; robot at index 0
      walls = Set.new # non-movable things; cause collisions

      @map.split.each_with_index {
        |line, row|
        line.chars.each_with_index {
          |char, col|
          if char=='@'
            locations.insert(0, [row, col..col])
          elsif char=='#'
            walls.add([row, col])
          elsif char=='O'
            locations.push([row, col..col])
          end
        }
      }
      push(locations, walls)
    end

    def part_2
      locations = [] # movable things; robot at index 0
      walls = Set.new # non-movable things; cause collisions
      @ncols *= 2

      @map.split.each_with_index {
        |line, row|
        line.chars.each_with_index {
          |char, col|
          if char=='@'
            locations.insert(0, [row, 2*col..2*col])
          elsif char=='#'
            walls.add([row, 2*col])
            walls.add([row, 2*col+1])
          elsif char=='O'
            locations.push([row, 2*col..2*col+1])
          end
        }
      }
      push(locations, walls)
    end
  end
end

executable = Y2024::Day15.new
executable.run