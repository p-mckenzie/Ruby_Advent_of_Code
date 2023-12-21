require_relative '../Base'

module Y2023
  class Day19 < Base
    @@day = 19
    @@year = 2023

    def initialize(data=get_data)
      workflows, parts = data.split("\n\n")

      @parts = parts.split("\n").map {
        |part|
        part.scan(/[xmas]/).zip(part.scan(/[-\d]+/).map(&:to_i)).to_h
      }

      @workflows = workflows.split("\n").map {
        |workflow|
        name, content = workflow.split("{")
        content = content[0...(content.length-1)].split(',')
        [name, content]
      }.to_h

      @accepted_ranges = []

      flow, range = ['in', {'x' => 1..4000, 'm' => 1..4000, 'a' => 1..4000, 's'=> 1..4000}]
      inspect(flow, range)
    end

    def inspect(flow, range)
      @workflows[flow].each {
        |workflow|
        if workflow.include?(':') then
          # need to split
          check, next_flow = workflow.split(':')
          xmas = check[0]
          cutoff = check[2..].to_i

          new_range = range.clone

          if check[1]=='>' then
            if new_range[xmas].max > cutoff then
              new_range[xmas] = [new_range[xmas].min, cutoff+1].max..new_range[xmas].max

              if next_flow=='A' then
                # log
                @accepted_ranges.push(new_range)
              elsif next_flow != 'R' then
                # go again
                inspect(next_flow, new_range)
              end

              # update range before going to next workflow
              range[xmas] = range[xmas].min..[range[xmas].max, cutoff].min
              next
            end

          elsif check[1]=='<' then
            if new_range[xmas].min < cutoff then
              new_range[xmas] = new_range[xmas].min..[new_range[xmas].max, cutoff - 1].min
              
              if next_flow=='A' then
                # log
                @accepted_ranges.push(new_range)
              elsif next_flow != 'R' then
                # go again
                inspect(next_flow, new_range)
              end

              # update range before going to next workflow
              range[xmas] = [range[xmas].min, cutoff].max..range[xmas].max
              next
            end
          end

        else
          # terminal node
          if workflow=='A' then
            # log
            @accepted_ranges.push(range)
          elsif workflow!='R' then
            # do it again
            inspect(workflow, range)
          end
        end
      }
    end

    def part_1
      @parts.filter {
        |part|
        @accepted_ranges.map {
          |range|
          'xmas'.chars.map {
            |char|
            range[char].cover?(part[char])
          }.all?
        }.any?
      }.map(&:values).flatten.sum
    end

    def part_2
      @accepted_ranges.map {|dict| dict.values.map(&:size).inject(:*)}.sum
    end
  end
end

executable = Y2023::Day19.new
executable.run
