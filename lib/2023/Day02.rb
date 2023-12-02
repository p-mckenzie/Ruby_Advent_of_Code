require_relative '../Base'

module Y2023
  class Day02 < Base
    @@day = 2
    @@year = 2023

    def initialize(data=get_data)
      @data = data.split("\n").map {
        |line|
        id, sets = line.split(":")
        id = id.split(" ").last.to_i
        sets = sets.split(";").map {
          |set|
          set.split(',').map{
            |cubes|
            count, color = cubes.strip.split(" ")
            [color, count.to_i]
          }.to_h
        }
        [id, sets]
      }.to_h
    end

    def part_1
      maxes = {'red' => 12, 'green' => 13, 'blue' =>14}

      possible = @data.filter {
        |id, sets|
        sets.map {
          |set|
          set.map {
            |color, number|
            maxes[color] && maxes[color]>=number
          }.all?
        }.all?
      }
      possible.keys.sum
    end

    def part_2
      @data.map {
        |id, sets|
        max = Hash.new(0)
        sets.each {
          |set|
          set.map {
            |color, qty|
            if qty>max[color] then
              max[color] = qty
            end
          }
        }
        max.values.inject(:*)
      }.sum
    end  
  end
end

executable = Y2023::Day02.new
executable.run
