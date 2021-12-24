require_relative '../Base.rb'

module Y2021
  class Day20 < Base
    @@day = 20
    @@year = 2021

    def initialize(data=get_data)
      @algorithm, @input_image  = data.gsub('#', '1').gsub('.', '0').split("\n\n")
      @input_image = @input_image.split("\n").map{|row| row.split('')}
      
      @lit = Hash.new('0')
      @input_image.each_with_index{
        |row, x|
        row.each_with_index {
          |entry, y|
          @lit[[x,y]] = entry
        }
      }
      main
    end

    def main
      (1..2).each {
        |i|
        enhance(i)
      }
        
      @part_1 = @lit.select {|key, val| val == '1'}.length

      (3..50).each {
        |i|
        enhance(i)
      }
      @part_2 = @lit.select {|key, val| val == '1'}.length
    end

    def enhance(i)
      next_image = Hash.new(i%2==1 ? @algorithm[0] : '0')

      x = @lit.keys.map {|entry| entry.first}
      y = @lit.keys.map {|entry| entry.last}

      (x.min-1..x.max+1).each {
        |x|
        (y.min-1..y.max+1).each {
          |y|
          binary_num = neighbors(x,y).map {
            |neighbor|
            @lit[neighbor]
          }.join('').to_i(2)

          next_image[[x,y]] = @algorithm[binary_num]
        }
      }
      @lit = next_image
    end

    def neighbors(x,y)
      (-1..1).map {
        |x_offset|
        (-1..1).map {
          |y_offset|
          [x+x_offset, y+y_offset]
        }
      }.flatten(1)
    end

    def part_1
      @part_1
    end

    def part_2
      @part_2
    end  
  end
end

executable = Y2021::Day20.new
executable.run