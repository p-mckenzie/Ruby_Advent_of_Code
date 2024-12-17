require_relative '../Base'

module Y2024
  class Day14 < Base
    @@day = 14
    @@year = 2024

    def initialize(data=get_data)
      @data = data.scan(/[-\d]+/).map(&:to_i).each_slice(4).to_a
    end

    def move(n)
      @data.map {
        |robot|
        [(robot[0] + robot[2] * n) % @xlim, (robot[1] + robot[3] * n) % @ylim]
      }
    end

    def tag(val, lim)
      if (0...lim / 2).include?(val) 
        0
      elsif (lim /2 + lim%2...).include?(val)
        1
      end
    end

    def display(robots)
      text = (0...@ylim).map {
        |y|
        (0...@xlim).map {
          |x|
          ' '
        }
      }
      robots.each {
        |x,y|
        text[y][x] = 'X'
      }
      return text.map(&:join).join("\n")
    end

    def part_1(xlim=101, ylim=103)
      @xlim = xlim
      @ylim = ylim
      move(100).map {
        |x,y|
        case [tag(x,@xlim), tag(y,@ylim)]
        when [0,0] 
          1
        when [0,1]
          2
        when [1,0]
          3
        when [1,1]
          4
        end
      }.compact.tally.values.inject(&:*)
    end

    def part_2(xlim=101, ylim=103)
      @xlim = xlim
      @ylim = ylim
      
      i = 0
      values = []
      loop do
        if move(i).tally.values.max==1
          break
        end
        i += 1
      end

      i
    end
  end
end

executable = Y2024::Day14.new
executable.run