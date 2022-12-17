require_relative '../Base'

module Y2022
  class Monkey
    attr_accessor :number, :items, :operation, :test, :targets, :inspected
    def initialize(number, items, operation, test, targets)
      @number = number
      @items = items
      @operation = operation
      @test = test
      @targets = targets
      @inspected = 0
    end

    def inspects(item)
      @inspected += 1
      old = item
      eval(@operation)
    end
  
  end

  class Day11 < Base
    @@day = 11
    @@year = 2022

    def initialize(data=get_data)
      @data = data
    end

    def make_monkeys
      @monkeys = @data.split("\n\n").map{
        |blob| 
        lines = blob.split("\n")
        monkey_number = lines[0].scan(/[\d]+/).first.to_i
        items = lines[1].scan(/[\d]+/).map(&:to_i)
        operation = lines[2].split("new = ")[1]

        # assume all tests are "divisible" tests
        test = lines[3].scan(/[\d]+/).first.to_i

        targets = lines[4,5].join.scan(/[\d]+/).map(&:to_i)
        Monkey.new(monkey_number, items, operation, test, targets)
    }.map{|monkey| [monkey.number, monkey]}.to_h
    @common_multiple = @monkeys.values.map(&:test).inject(&:*) 
    end

    def turn(monkey, part_2=true)
      monkey.items.map do
        |item|
        worry_level = monkey.inspects(item) 
        if part_2 then
          worry_level = worry_level % @common_multiple
        else
          worry_level = worry_level / 3
        end

        if worry_level % monkey.test == 0 then
          @monkeys[monkey.targets[0]].items.append(worry_level)
        else
          @monkeys[monkey.targets[1]].items.append(worry_level)
        end
      end
      monkey.items = []
    end

    def turns(n, part_2 = false)
      make_monkeys
      n.times do
        @monkeys.each do
          |key, monkey| 
          turn(monkey, part_2=part_2)
        end
      end
      @monkeys.values.map(&:inspected).sort[-2..].inject(&:*)
    end

    def part_1
      turns(20)
    end

    def part_2
      turns(10000, part_2=true)
    end
  end
end

executable = Y2022::Day11.new
executable.run
