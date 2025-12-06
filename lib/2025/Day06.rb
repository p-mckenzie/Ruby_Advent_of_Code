require_relative '../Base'

module Y2025
  class Day06 < Base
    @@day = 6
    @@year = 2025

    def initialize(data=get_data)
      data = data.split("\n")
      @ops_and_locs = []
      data.last.scan(/\*|\+/) do |c|
        @ops_and_locs << [c, $~.offset(0)[0]]
      end

      @data = []

      (@ops_and_locs+[[0,data.first.size+1]]).each_cons(2) do
        |a, b|
        @data << data[...-1].map {
          |row| 
          row[a[1]...b[1]-1]
        }

      end
    end

    def part_1
      @ops_and_locs.each_with_index.map {
        |op, i|
        op_str, op_index = op
        
        if op_str=='*' then
          @data[i].map(&:to_i).inject(:*)
        else
          @data[i].map(&:to_i).inject(:+)
        end
        }.sum
    end

    def part_2
      @ops_and_locs.each_with_index.map {
        |op, i|
        op_str, op_index = op

        arr = @data[i]
        dim = arr.map(&:size).max
        transformed_elements = (0...dim).map {|j| arr.map{|str|str[j]}.join.to_i}

        if op_str=='*' then
          transformed_elements.inject(:*)
        else
          transformed_elements.inject(:+)
        end
        }.sum
    end  
  end
end

executable = Y2025::Day06.new
executable.run