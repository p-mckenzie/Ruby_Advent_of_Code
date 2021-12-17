require_relative '../Base.rb'

module Y2021
  class Day14 < Base
    @@day = 14
    @@year = 2021

    def initialize(data=get_data)
      @template, @rules = data.split("\n\n")
      
      @patterns = Hash.new('')
      @rules.split("\n").each {
        |mapping|
        pattern, insert = mapping.split(" -> ")
        @patterns[pattern] = insert
      }

      @polymer = Hash.new(0)
      (0...@template.length-1).each {
        |i|
        @polymer[@template[i..i+1]] += 1
      }

      main

    end

    def main
      10.times {
        extend_polymer
      }
      @polymer_1 = @polymer

      30.times {
        extend_polymer
      }
      @polymer_2 = @polymer
    end

    def extend_polymer
      next_polymer = Hash.new(0)
      @polymer.each {
        |key, val|
        to_insert = @patterns[key]
        next_polymer[key[0]+to_insert] += val
        next_polymer[to_insert+key[1]] += val
      }
      @polymer = next_polymer
    end

    def count_elements(polymer)
      counts = Hash.new(0)
      polymer.each {
        |key, val|
        counts[key[0]] += val
        counts[key[1]] += val
      }

      counts.each {
        |char, count|
        counts[char] = ((char==@template[0]) || (char==@template[-1])) ? count/2+1 : count/2
      }
      counts.values.max - counts.values.min
    end

    def part_1
      count_elements(@polymer_1)
    end

    def part_2
      count_elements(@polymer_2)
    end  
  end
end

executable = Y2021::Day14.new
executable.run