require_relative '../Base'

module Y2023
  class Day01 < Base
    @@day = 1
    @@year = 2023

    def initialize(data=get_data)
      @data = data.split("\n")

      @results = @data.map{|row| 
        num_indices = index_of_numbers(row)
        word_indices = index_of_words(row).merge(num_indices)

        [
          if num_indices.empty? then 
            0 
          else (num_indices.min[1] + num_indices.max[1]).to_i 
          end, 
          (word_indices.min[1] + word_indices.max[1]).to_i
        ]
      }
    end

    def index_of_numbers(row)
      # identify integer locations
      row.split("").each_with_index.map {
        |char, idx|
        if char.match(/[0-9]/) then
          [idx, char]
        end
      }.compact.to_h
    end

    def index_of_words(row)
      guide = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']

      # identify named locations
      guide.each_with_index.map {
        |named_number, idx|
        (0 ... row.length).map { 
          |i| 
          if row[i,named_number.length] == named_number then
            [i, (idx+1).to_s]
          end
        }.compact
      }.flatten(1).to_h
    end

    def part_1
      @results.map(&:first).sum
    end

    def part_2
      @results.map(&:last).sum
    end  
  end
end

executable = Y2023::Day01.new
executable.run
