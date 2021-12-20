require_relative '../Base.rb'

module Y2021
  class Day18 < Base
    @@day = 18
    @@year = 2021

    attr_reader :snailfish_num

    def initialize(data=get_data)
      @data = data.split("\n").map{|entry| eval(entry) }
    end

    def calc_part_1
      # calculate magnitude of input as-is
      @snailfish_num = deep_copy(@data[0])
      @data[1..-1].each {
        |num|
        @snailfish_num = add(@snailfish_num, deep_copy(num))
        reduce
      }

      magnitude
      @part_1 = @magnitude.clone
    end

    def calc_part_2
      # calculate maximum possible magnitude from any 2 lines in the input
      @part_2 = 0
      @data.permutation(2) {
        |a, b|
        @snailfish_num = add(deep_copy(a), deep_copy(b))
        reduce
        magnitude
        if @magnitude > @part_2 then
          @part_2 = @magnitude
        end
      }
    end

    def add(x,y)
      return [x,y]
    end

    def construct(path, value=@snailfish_num)
      search = value
          path.each {
            |i|
            search = search[i]
          }
      search
    end
    
    def update_value_at_path!(array_to_update, path_to_value, new_value, sum=false)
      *p, target = path_to_value
      if path_to_value.length ==0  then
        return
      end

      if p.length == 0 then
        ref = array_to_update
      else
        ref = array_to_update.dig(*p)
      end
      if sum then
        ref[target] += new_value
      else
        ref[target] = new_value
      end

    end

    def explode
      add_to_left, add_to_right = @explode_values
      update_value_at_path!(@snailfish_num, @explode_paths[0], add_to_left, sum=true)
      update_value_at_path!(@snailfish_num, @explode_paths[2], add_to_right, sum=true)
      update_value_at_path!(@snailfish_num, @explode_paths[1], 0)
    end

    def split
      current = construct(@split_path)
      new_value = [(current/2.to_f).floor, (current/2.to_f).ceil]
      update_value_at_path!(@snailfish_num, @split_path, new_value)
    end

    def reset
      @path = []
      @search = @snailfish_num

      @to_explode = false
      @explode_paths = [[], [], []]

      @to_split = false
      @split_path = []
    end

    def reduce
      @search = @snailfish_num
      @path = []

      @to_explode = false
      @explode_paths = [[], [], []]

      @to_split = false
      @split_path = []
      loop do
        
        if @search.is_a? Array then
          
          if (@path.length>=4) & (not @to_explode) then
            # needs to explode
            # save current path as item to remove
            @to_explode = true
            @explode_values = @search.clone
            @explode_paths[1] = @path.clone

            # continue searching for next integer
            @path[-1] += 1
            @search = construct(@path)
            next
          else
            # "zoom in" to the array
            @search = @search[0]
            @path << 0
          end

        elsif @search.is_a? Numeric then
          # check if we're in the process of exploding, then do it
          if not @to_explode then
            # store a copy of this path, in case the next found item needs to explode outwards
            @explode_paths[0] = @path.clone
          else
            # in the process of exploding
            # the current path is to the right of the exploding item
            @explode_paths[2] = @path.clone
            
            explode

            # start re-reducing the whole number from the beginning
            reset
            next
          end

          if @search >= 10 then
            # splits
            if not @to_split then
              # store first occurrence of a split (left to right)
              @to_split = true
              @split_path = @path.clone
            end
          end

          # otherwise, this integer is fine as-is
          # move to the right at the same level
          @path[-1] += 1
          @search = construct(@path)
        else
          # item will be nil if the path is invalid
          # probably due to "moving to the right" to a path that doesn't exist
          # backtrack
          @path = @path[0...-1]

          if @path.length == 0 then
            # visited all valid paths, exit the loop
            break
          end

          # "move to the right" on new bottom level, then continue searching
          @path[-1] += 1
          @search = construct(@path)
          next
        end
      end

      # after visiting all paths, ensure that there isn't a pending explosion or split
      # if there is, call reduce again to continue the process
      if @to_explode then
        explode
        reset
        reduce
      elsif @to_split then
        split
        reset
        reduce
      end

    end

    def deep_copy(x)
      return Marshal.load(Marshal.dump(x))
    end

    def magnitude
      @magnitude = deep_copy(@snailfish_num)
      @search = @magnitude
      @path = []

      loop do
        if @search.is_a? Array then
          # "zoom in" to the array
          @search = @search[0]
          @path << 0
        
        elsif @search.is_a? Numeric then
          if @path.length == 0 then
            break
          end

          @path[-1] += 1
          pair_element = construct(@path, @magnitude)
          if pair_element.is_a? Numeric then
            local_magnitude = 3*@search + 2*pair_element

            @path = @path[0...-1]
            if @path.length == 0 then
              # found the final value
              @magnitude = local_magnitude
              break
            else
              update_value_at_path!(@magnitude, @path, local_magnitude)

              # reset and start again
              @search = @magnitude
              @path = []
              next
            end

          else
            # keep looking
            @search = pair_element
            next
          end
        else
          # item will be nil if the path is invalid
          # probably due to "moving to the right" to a path that doesn't exist
          # backtrack
          @path = @path[0...-1]

          if @path.length == 0 then
            # visited all valid paths, exit the loop
            break
          end

          # "move to the right" on new bottom level, then continue searching
          @path[-1] += 1
          @search = construct(@path, @magnitude)
          next
        end
      end
    end

    def part_1
      if not @part_1 then
        calc_part_1
      end
    end

    def part_2
      if not @part_2 then
        calc_part_2
      end

      @part_2
    end  
  end
end

executable = Y2021::Day18.new
executable.run