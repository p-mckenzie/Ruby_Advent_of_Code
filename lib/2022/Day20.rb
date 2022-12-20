require_relative '../Base'

module Y2022
  class Number
    attr_accessor :num, :parent, :child
    def initialize(num)
      @num = num
    end

    def set_loc(parent, child)
      @parent = parent
      @child = child
    end

    def inspect
      "#{@num} after #{@parent.num} and before #{@child.num}"
    end
  end

  class Day20 < Base
    @@day = 20
    @@year = 2022

    @@decription_key = 811589153

    def initialize(data=get_data)
      @numbers = data.split.map(&:to_i)
    end

    def setup
      @map = @numbers.map {|num| Number.new(num)}

      @map.each_with_index {
        |number, idx|
        number.set_loc(@map[(idx - 1) % @map.length], @map[(idx + 1) % @map.length])
        if number.num == 0 then
          @head = number 
        end
      }
    end

    def go(number, n: nil)
      n ||= number.num
      inspect = number

      if n > 0 then
        n.times {inspect = inspect.child}
      elsif n < 0 then
        (n.abs + 1).times {inspect = inspect.parent}
      end
      inspect
    end

    def move(number, n: nil)
      # fill the gap
      number.parent.child = number.child
      number.child.parent = number.parent

      new_parent = go(number, n: n)

      # point number to new parent and child
      number.parent = new_parent
      number.child = new_parent.child

      # point new parent and child to number
      new_parent.child = number
      number.child.parent = number
    end

    def part_1
      setup

      @map.each {
        |number|
        if number==@head then next end
        move(number)
      }
      [1000,2000,3000].map {|n| go(@head, n: n).num}.sum
    end

    def part_2
      setup

      10.times do
        @map.each {
          |number|
          if number==@head then next end
          move(number, n: (number.num * @@decription_key) % (@map.length - 1))
        }
      end
      [1000,2000,3000].map {|n| go(@head, n: n).num * @@decription_key}.sum
    end
  end
end

executable = Y2022::Day20.new
executable.run