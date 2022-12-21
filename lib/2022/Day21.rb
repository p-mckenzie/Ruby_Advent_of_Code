require_relative '../Base'

module Y2022
  class Monkey
    attr_accessor :name, :references, :op, :yells
    
    def initialize(name:, references:[])
      @name = name
      if references.length > 1 then
        @references = [references[0], references[2]]
        @op = references[1]
      else
        @yells = references.first.to_i
      end
    end

    def yells
      if @yells then 
        @yells
      else
        a,b = @references.map(&:yells)
        if a.is_a?(Integer) and b.is_a?(Integer) then
          eval("#{a} #{op} #{b}")
        else
          "(#{a} #{op} #{b})"
        end
      end
    end

    def inspect
      "Monkey #{@name}"
    end
  end

  class Day21 < Base
    @@day = 21
    @@year = 2022

    @@operation_map = {'/' => '*', '*' => '/', '+' => '-', '-' => '+'}

    def initialize(data=get_data)
      @monkeys = data.split("\n").map {|txt|
        name, instructions = txt.split(": ")
        Monkey.new(name: name, references: instructions.split)
      }
      @monkeys.select {|m| m.references }.each {
        |monkey|
        monkey.references = monkey.references.map {|m| @monkeys.find {|search| m == search.name}}
      }
      @root = @monkeys.find {|m| m.name == 'root'}
    end

    def resolve(left, right)
      # remove surrounding parenthesis
      left = left[1...-1]

      sections = left.split(" ")

      # find the external number
      if sections[0].to_i.to_s == sections[0] then
        val = sections[0].to_i
        left = sections[2..].join(' ')
        op = @@operation_map[sections[1]]

        if op=='+'
          # need to swap signs if c - f(x) = right to get f(x) = -right + c
          right = -right
        end

      elsif sections[-1].to_i.to_s == sections[-1] then
        val = sections[-1].to_i
        left = sections[0...-2].join(' ')
        op = @@operation_map[sections[-2]]
      end

      [left, eval("#{right} #{op} #{val}")]
    end

    def part_1
      # run equations
      @root.yells
    end

    def part_2
      # build equation with unknowns, then resolve algebra
      @monkeys.find {|m| m.name == 'humn'}.yells = 'x'
      @root.op = '=='
      equation = @root.yells[1...-1]

      # these should stay in the form left = right
      left, right = equation.split(" == ")
      right = right.to_i
      while left!='x' do
        left, right = resolve(left, right)
      end

      # right equals x!
      right
    end
  end
end

executable = Y2022::Day21.new
executable.run