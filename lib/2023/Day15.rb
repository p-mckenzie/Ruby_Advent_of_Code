require_relative '../Base'

module Y2023
  class Day15 < Base
    @@day = 15
    @@year = 2023

    def initialize(data=get_data)
      @data = data.strip.split(",")
    end

    def hash(st)
      current_value = 0
      st.chars.each {
        |char|
        current_value += char.ord
        current_value = current_value * 17 % 256
      }
      current_value
    end

    def part_1
      @data.map {
        |string|
        hash(string)
      }.sum
    end

    def part_2
      boxes = Hash.new{|h,k| h[k] = Hash.new }

      @data.each {
        |string|
        label = string.scan(/[a-z]+/).first
        box = hash(label)

        if string.end_with?('-') then
          # remove lens with label
          boxes[box].delete(label)
        else
          focal_length = string.scan(/[0-9]+/).last.to_i
          boxes[box][label] = focal_length
        end
      }

      boxes.map {
        |box_key, box_contents|
        box_contents.each_with_index.map {
          |contents, indx|
          label, focal_length = contents
          (box_key + 1) * (indx+1) * focal_length
        }.sum
      }.sum
    end
  end
end

executable = Y2023::Day15.new
executable.run
