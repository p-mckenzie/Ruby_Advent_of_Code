require_relative '../Base'

module Y2022
  class Day13 < Base
    @@day = 13
    @@year = 2022

    @@divider_packets = [[[2]], [[6]]]

    def initialize(data=get_data)
      @pairs = data.split("\n\n").map{|pairs| pairs.split("\n").map {|pair| eval(pair)}}
    end

    def print(l)
      if l.is_a?(Array) then 
        '[' + l.map{|x| print(x)}.join(', ') + ']'
      else
        l
      end
    end

    def compare(l, r)
      if l.is_a?(Integer) and r.is_a?(Integer) then
        if l < r then
          return true
        elsif l > r then
          return false
        end
      elsif l.is_a?(Integer) or r.is_a?(Integer) then
        return compare(if l.is_a?(Integer) then [l] else l end,
           if r.is_a?(Integer) then [r] else r end
        )
      else
        # both should be arrays at this point
        (0...[r.length, l.length].max).each {
          |i|
          if l[i].nil? then
            return true
          elsif r[i].nil? then
            return false
          else 
            case compare(l[i],r[i])
            when true
              return true
            when false
              return false
            when nil
              next
            end
          end
        }
      end
      nil
    end

    def part_1
      @pairs.each_with_index.map {|pair, index| if compare(*pair) then index+1 else 0 end}.sum
    end

    def part_2
      unordered = @pairs.flatten(1)
      final = @@divider_packets.clone

      unordered.each {
        |to_place|
        j = final.length - 1
        while compare(to_place, final[j]) do
          j -= 1
          if j<0 then break end
        end
        final.insert(j+1, to_place)
      }

      @@divider_packets.map {|packet| final.index(packet)+1}.inject(:*)
    end
  end
end

executable = Y2022::Day13.new
executable.run