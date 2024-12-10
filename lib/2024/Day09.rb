require_relative '../Base'

module Y2024
  class Day09 < Base
    @@day = 9
    @@year = 2024

    def initialize(data=get_data)
      @blocks = Hash.new
      @free_space = Hash.new
      index = 0
      data.chars.each_slice(2).each_with_index {
        |arr, file_index|
        file, free = arr
        @blocks[index] = [file_index, file.to_i]
        index += file.to_i

        if free.to_i>0
          @free_space[index] = free.to_i
          index += free.to_i
        end
      }
    end

    def solve(limit=false)
      blocks = @blocks.clone
      free_space = @free_space.clone

      order = blocks.keys.reverse

      order.each {
        |block_loc|
        while blocks[block_loc]
          block_id, block_length = blocks[block_loc]

          if limit
            loc = free_space.select{|k,v| v>=block_length}.keys.min
          else
            loc = free_space.keys.min
          end

          if !loc || block_loc<loc
            break
          end
          
          length = free_space[loc]
          overlap = [block_length, length].min
          blocks[loc] = [block_id, overlap]

          if overlap==block_length
            blocks.delete(block_loc)
          else
            blocks[block_loc] = [block_id, block_length - overlap]
          end

          free_space.delete(loc)
          if overlap<length
            free_space[loc+overlap] = length - overlap
          end
        end
      
      }
      blocks.map{
        |k, val|
        id, length = val
        (0...length).map {|i| id*(k+i) }.sum
      }.sum
    end

    def part_1
      solve
    end

    def part_2
      solve(true)
    end
  end
end

executable = Y2024::Day09.new
executable.run