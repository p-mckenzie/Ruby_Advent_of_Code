require_relative '../Base'

module Y2022
  class Iterator
    attr_reader :place

    def initialize(items)
      @items = items
      @place = 0
    end

    def next
      @place = (@place + 1) % @items.length
      return @items[@place - 1].clone
    end
  end

  class Rock
    attr_accessor :item
    def initialize(item)
      @item = item
    end

    def width
      @item.map(&:length).max
    end

    def height
      @item.length
    end
  end

  class Day17 < Base
    @@day = 17
    @@year = 2022

    @@rocks = [
'1111',
'010
111
010',
'001
001
111',
'1
1
1
1',
'11
11'].map{|item| item.split("\n").map{|entry| entry.split('').map(&:to_i) }}

    @@wall = 7

    def initialize(data=get_data)
      @jets = Iterator.new(data.strip.split(''))
      @rocks = Iterator.new(@@rocks.map{|rock| Rock.new(rock) })

      @stopped = Hash.new { Array.new(@@wall) {|j| 0} }
      @log = Hash.new
      @rocks_dropped = 0
    end

    def valid_position(falling_rock, x, y)
      # collides with side walls?
      if x < 0 or x + falling_rock.width - 1 >= @@wall then
        return false
      end

      # collides with floor?
      if y - falling_rock.height + 1 < 0 then
        return false
      end

      #collides with existing rock?
      (0...falling_rock.height).map {|height| if @stopped[y-height] then @stopped[y-height][x...x+falling_rock.width].each_with_index.map {|x, i| [falling_rock.item[height][i], x].sum < 2} else true end }.flatten.all?
    end

    def place(falling_rock, x, y)
      @rocks_dropped += 1

      (0...falling_rock.height).each do
        |height|
        y_dim = y - height
        item = falling_rock.item[height]

        @stopped[y_dim] = @stopped[y_dim]
        @stopped[y_dim][x...x+falling_rock.width] = @stopped[y_dim][x...x+falling_rock.width].each_with_index.map {|x, i| [item[i], x].max}
      end

      if @cycle_height then return end
      
      # log position to identify cycles
      fingerprint = (y-400..y).map{|i| @stopped[i].join}.reverse.join("\n")
      if @log[[@jets.place, @rocks.place, fingerprint]] then
        @cycle_height = y - @log[[@jets.place, @rocks.place, fingerprint]][0]
        @cycle_rocks = @rocks_dropped - @log[[@jets.place, @rocks.place, fingerprint]][1]
      else
        @log[[@jets.place, @rocks.place, fingerprint]] = [y, @rocks_dropped]
      end
    end

    def display
      puts @stopped.select {|key, x| x.sum > 0 }.sort_by{|key, val| -key}.map {|key, row| '|' + row.map {|x| x == 0 ? '.' : '#' }.join + '|'}.join("\n")
      puts
    end

    def drop_rock
      falling_rock = @rocks.next

      # represents the top left corner
      x = 2
      y = 3 + @stopped.length + falling_rock.height - 1

      while true do 
        # first, push rock in either direction (if possible)
        if @jets.next == '<' then
          if valid_position(falling_rock, x-1, y) then
            x -= 1
          end
        else
          if valid_position(falling_rock, x+1, y) then
            x += 1
          end
        end

        # next, fall the rock 1 space (if possible)
        if valid_position(falling_rock, x, y-1) then
          y -= 1
        else
          place(falling_rock, x, y)
          break
        end
      end
    end

    def part_1
      while @rocks_dropped < 2022 do
        drop_rock
      end

      @stopped.keys.max + 1
    end

    def part_2
      goal = 1000000000000

      while !@cycle_height do
        drop_rock
      end

      # how many cycles to reach the goal?
      cycles_to_goal = (goal - @rocks_dropped) / @cycle_rocks

      # go as far as needed to be on the same cycle pattern as goal
      ((goal - @rocks_dropped) % @cycle_rocks).times do
        drop_rock
      end

      # current height plus cycles_to_goal * cycle_height
      @stopped.keys.max + 1 + cycles_to_goal*@cycle_height
    end
  end
end

executable = Y2022::Day17.new
executable.run
