require_relative '../Base'

module Y2025
  class Day02 < Base
    @@day = 2
    @@year = 2025

    def initialize(data=get_data)
      @data = data.split(',').map {
        |line|
        Range.new(*line.split('-').map(&:to_i))
      }
    end

    def part_1
      @data.map {
        |range|
        range.map {
          |n|
          str = n.to_s
          if str.size.odd? then
            0
          elsif str[...str.size / 2] == str[str.size / 2..] then
            n
          else
            0
          end          
        }
      }.flatten.sum
    end

    def part_2
      @data.map {
        |range|
        range.map {
          |n|
          str = n.to_s

          (1..str.size/2).map {
            |chunk_size|
            
            if str.size % chunk_size !=0 then
              0
            elsif str.each_char.each_slice(chunk_size).map(&:join).uniq.count == 1 then
              n
            else
              0
            end
          }.max
        }
      }.flatten.compact.sum
    end  
  end
end

executable = Y2025::Day02.new
executable.run