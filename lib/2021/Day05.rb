require_relative '../Base.rb'

module Y2021
  class Day05 < Base
    @@day = 5
    @@year = 2021

    def initialize(data=get_data)
      @data = data.split("\n")
      @lines = @data.map{|line| line.split(" -> ").map {|entry| entry.split(',').map(&:to_i)}}

      @counts_1 = Hash.new(0)
      @counts_2 = Hash.new(0)

      main

    end

    def main
      @lines.each { |line|
        #sorts ascending by first element
        line.sort! 
        xrange = [line[0][0], line[1][0]]
        yrange = [line[0][1], line[1][1]]

        # vertical/horizontal lines
        if (xrange.uniq.length==1 or yrange.uniq.length==1)
          then
           (xrange[0]..xrange[1]).each { |x|
             (yrange.min..yrange.max).each{ |y|
               @counts_1[[x, y]] += 1
               @counts_2[[x, y]] += 1
             }
           }
        # diagonal lines (sorted so x is ascending)
        else
          (0..xrange[1]-xrange[0]).each{|offset|
            x = xrange[0]+offset           
            y = yrange[0]+(yrange[1]>yrange[0] ? offset : -offset)
            @counts_2[[x, y]] += 1
        }
        end
      }
    end

    def part_1
      @counts_1.select {|key, val| val >= 2}.length
    end

    def part_2
      @counts_2.select {|key, val| val >= 2}.length
    end  
  end
end

executable = Y2021::Day05.new
executable.run