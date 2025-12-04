require_relative '../Base'

module Y2025
  class Day01 < Base
    @@day = 1
    @@year = 2025

    def initialize(data=get_data)
      @data = data.split.map {
        |line|
        dir = line[0]
        mag = line[1..]

        (dir == 'L' ? -1 : 1) * mag.to_i
      }

      @start = 50
    end

    def part_1
      val = @start
      @data.map {
        |num|
        val = (val + num) % 100
        if val==0
          1
        else
          0
        end
      }.sum
    end

    def part_2
      val = new_val = @start
      @data.map {
        |num|
        val = new_val % 100
        new_val = (val + num)

        if num>0 then
          # moving right
          click_val = val + 1
          range = (click_val..new_val)
        else
          click_val = val - 1
          range = (new_val..click_val)
        end

        # difference in hundreds
        diff = (range.max/100 - range.min/100)

        # 1 extra if we cover exactly 0
        if (range.min%100..range.max%100).include?(0) then
          diff += 1
        end

        diff
      }.sum
    end  
  end
end

executable = Y2025::Day01.new
executable.run