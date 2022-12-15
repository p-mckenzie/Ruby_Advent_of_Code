require_relative '../Base'
require 'Set'

module Y2022
  class Day15 < Base
    @@day = 15
    @@year = 2022

    def initialize(data=get_data, max=4000000)

    @max = max
    @coords = data.split("\n").map {|entry| entry.scan(/[\d-]+/).map(&:to_i)}.map{|ar| [ar[0], ar[1], manhattan(*ar)]}
    end

    def manhattan(a,b,c,d)
      (a-c).abs + (b-d).abs
    end

    def part_1
      intervals = @coords.map {
        |x,y,length|
        d = length - (@max/2 - y).abs
        if d >= 0 then
          [x - d, x+d]
        end
      }.compact.sort

      start, stop, holes = *intervals[0], 0
      intervals.each {
        |nstart, nstop|
        holes = [0, nstart-stop-1].max
        stop = [stop, nstop].max
      }
      stop - start - holes
    end

    def part_2
      a = Set.new(@coords.map {|x,y,length| x-y+length+1})
      b = Set.new(@coords.map {|x,y,length| x-y-length-1})
      p = a.intersection(b)
      
      c = Set.new(@coords.map {|x,y,length| x+y+length+1})
      d = Set.new(@coords.map {|x,y,length| x+y-length-1})
      q = c.intersection(d)

      x,y = p.to_a.product(q.to_a).map {|p,q| [(p+q)/2, (q-p)/2]}.sort.first
      4000000 * x + y
    end
  end
end

executable = Y2022::Day15.new
executable.run
