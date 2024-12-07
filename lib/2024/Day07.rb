require_relative '../Base'

module Y2024
  class Day07 < Base
    @@day = 7
    @@year = 2024

    def initialize(data=get_data)
     @data = data.split("\n").map{
      |line|
      checksum, arr = line.split(": ")
      [checksum.to_i, arr.split.map(&:to_i)]
      }
    end

    def compute(x,y, op)
      op.call(x,y)
    end

    def validate(checksum, arr, index, total)
      @operators.map {
        |op|
        if not arr[index]
          false
        else
          result = compute(total, arr[index], op)
          if result==checksum && index==arr.length-1
            true
          elsif result>checksum
            false
          else
            validate(checksum, arr, index+1, result)
          end
        end
          }.any?
    end

    def part_1
      @operators =  [->(x,y) { x * y }, ->(x,y) { x + y }]

      @data.map {
        |checksum, arr|
        if validate(checksum, arr, 1, arr.first)
          checksum
        else
          0
        end
      }.sum
    end

    def part_2
      @operators =  [
        ->(x,y) { x * y }, 
        ->(x,y) { x + y },
        ->(x,y) { (x.to_s + y.to_s).to_i  },
      ]

      @data.map {
        |checksum, arr|
        if validate(checksum, arr, 1, arr.first)
          checksum
        else
          0
        end
      }.sum
    end
  end
end

executable = Y2024::Day07.new
executable.run