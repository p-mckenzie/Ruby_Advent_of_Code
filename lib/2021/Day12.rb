require_relative '../Base.rb'

module Y2021
  class Day12 < Base
    @@day = 12
    @@year = 2021

    def initialize(data=get_data)
      @data = data.split("\n")
      
      @network = Hash.new{ |hash, key| hash[key] = [] }
      @data.each {
        |entry|
        start_point, end_point = entry.split('-')
        start_point.strip!
        end_point.strip!

        @network[start_point] << end_point
        @network[end_point] << start_point
      }

      @identified_paths_1 = []
      @identified_paths_2 = []

      main

    end

    def main
      path = ['start']
      indexes = [-1]

      while true do
        # check if there is a valid next location to go from current location
        next_location = @network[path[-1]][indexes[-1]+1]
        if next_location then
          # proceed
          indexes[-1] += 1
          path << next_location
          indexes << -1
        else
          # backtrack
          path = path[0...-1]
          indexes = indexes[0...-1]
          if path.length == 0 then break end
          next
        end
        
        # check if the location just reached is a duplicate small cave - if so, remove it from the path
        all_counts = path.group_by(&:itself).transform_values(&:count).select {|key, val| (key == key.downcase)}
        
        # the start location can only be visited once
        invalid_start = all_counts['start']? (all_counts['start'] > 1) : false
        
        # only one small cave can appear more than once
        # this special small cave must be visited no more than twice
        counts = all_counts.select {|key, val| key!='start'}
        if counts.length>0 then
          too_many_multiples = counts.values.select {|x| x>1}.length > 1
          too_many_of_one = counts.values.max > 2
        else
          too_many_multiples = false
          too_many_of_one = false
        end
        
        # if any condition renders this path invalid, backtrack
        if ( invalid_start || too_many_multiples || too_many_of_one) then
          path = path[0...-1]
          indexes = indexes[0...-1]
        end

        # check if the location just reached is the end - if so, log, backtrack, and keep going
        if path[-1] == 'end' then
          if counts.values.select {|x| x>1}.length == 0 then
            # no small caves visited twice
            @identified_paths_1 << path
          end
          @identified_paths_2 << path
          
          path = path[0...-1]
          indexes = indexes[0...-1]
        end
      end
    end

    def part_1
      @identified_paths_1.length
    end

    def part_2
      @identified_paths_2.length
    end  
  end
end

executable = Y2021::Day12.new
executable.run