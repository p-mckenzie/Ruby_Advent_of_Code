require_relative '../Base.rb'

module Y2021
  class Day16 < Base
    @@day = 16
    @@year = 2021

    def initialize(data=get_data)
      @data = data.split('').map {|hexnum| hexnum.hex.to_s(2).rjust(4, '0')}.join('')
      @packet_version_sum = 0
      @outermost_packet_value, leftover_contents = process_packet(@data)

    end


    def process_packet(contents)
      packet_version = contents[0..2].to_i(2)
      @packet_version_sum += packet_version
      type_id = contents[3..5].to_i(2)
      contents = contents[6..-1]

      if type_id == 4 then
        # literal value packet
        literal_value, leftover_contents = process_literal_packet(contents)
      
      else
        # operator packet
        length_type_id = contents[0].to_i
        contents = contents[1..-1]
        literal_values = []
        
        if length_type_id == 0 then
          # 15 bits represent total length
          subpacket_length = contents[0..14].to_i(2)
          subpacket_contents = contents[15..-1]
          goal_length = subpacket_contents.length - subpacket_length

          while subpacket_contents.length > goal_length do
            subpacket_lit, subpacket_contents = process_packet(subpacket_contents)
            literal_values << subpacket_lit
          end

        elsif length_type_id == 1 then
          # 11 bits represent total length
          num_subpackets = contents[0..10].to_i(2)
          subpacket_contents = contents[11..-1]

          num_subpackets.times do
            subpacket_lit, subpacket_contents = process_packet(subpacket_contents)
            literal_values << subpacket_lit
          end

        end

        # resolve the remainder
        # retain contents to continue process packets, if necessary
        leftover_contents = subpacket_contents

        # compute this packet's literal value based on all subpacket values
        case type_id
        when 0
          literal_value = literal_values.sum
        when 1
          literal_value = literal_values.inject(:*)
        when 2
          literal_value = literal_values.min
        when 3
          literal_value = literal_values.max
        when 5
          literal_value = literal_values[0] > literal_values[1] ? 1 : 0
        when 6
          literal_value = literal_values[0] < literal_values[1] ? 1 : 0
        when 7
          literal_value = literal_values[0] == literal_values[1] ? 1 : 0
        end
        
      end

      return literal_value, leftover_contents
    end

    def process_literal_packet(contents)
      lit = ''
      loop do 
        prefix = contents[0]
        lit << contents[1..4]
        contents = contents[5..-1]
        if prefix.to_i == 0 then 
          break 
        end
      end 
      lit = lit.to_i(2)
      return lit, contents
    end

    def part_1
      @packet_version_sum
    end

    def part_2
      @outermost_packet_value
    end  
  end
end

executable = Y2021::Day16.new
executable.run