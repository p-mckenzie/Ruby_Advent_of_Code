require_relative '../Base.rb'

module Y2021
  class Day10 < Base
    @@day = 10
    @@year = 2021

    @@points_incorrect = {')' => 3, ']' => 57, '}' => 1197, '>' => 25137}
    @@points_incomplete = {')' => 1, ']' => 2, '}' => 3, '>' => 4}

    def initialize(data=get_data)
      @data = data.split("\n")

      @closing =  { ')' => '(',
                ']' => '[',
                '}' => '{',
                '>' => '<'
     }
     @opening = @closing.map(&:reverse).to_h

     @score_incorrect = 0
     @score_incomplete = []

      main

    end

    def main
      open = Hash.new(0)

      @data.each {
        |line|
        pattern = ''
        catch :invalidpattern do
          line.split('').each {
            |char|
            if @closing.keys.include? char then
              # closes segment - must do so correctly
              if @closing[char] == pattern[-1] then
                pattern = pattern[0..-2]
              else
                # raise an issue
                @score_incorrect += @@points_incorrect[char]
                throw :invalidpattern
              end
            elsif @closing.values.include? char then
              # open segment
              pattern << char
            end
        }

        # complete line
        score = 0
        while pattern.length>0 do
          score = score*5 + @@points_incomplete[@opening[pattern[-1]]]
          pattern = pattern[0...-1]
        end
        @score_incomplete << score
      end
      }
    end

    def part_1
      @score_incorrect
    end

    def part_2
      @score_incomplete.sort[(@score_incomplete.length/2).floor]
    end  
  end
end

executable = Y2021::Day10.new
executable.run