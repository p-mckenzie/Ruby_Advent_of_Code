require_relative '../Base'

module Y2024
  class Day12 < Base
    @@day = 12
    @@year = 2024

    def initialize(data=get_data)
      @data = data.split.map(&:chars)

      @nrows = @data.length
      @ncols = @data.first.length

      @connections = Hash.new { |hash, key| hash[key] = Set.new }

      (0...@nrows).each {
        |row|
        (0...@ncols).each {
          |col|
          @connections[[row, col]].add([row, col])
          [[row, col+1], [row+1, col]].each {
            |test_row, test_col|
            if valid?(test_row, test_col) && @data[test_row][test_col]==@data[row][col]
              @connections[[row, col]].add([test_row, test_col])
              @connections[[test_row, test_col]].add([row, col])
            end
          }
        }
      }

      # holds root plot address -> set of all nodes in plot
      @plots = Hash.new { |hash, key| hash[key] = Set.new }
      @addresses = Hash.new

      # search for root of new plots
      (0...@nrows).each {
        |row|
        (0...@ncols).each {
          |col|
          if @addresses[[row, col]]
            # we've already tagged this location
            next
          end

          # expand outward, finding all neighbors with the same plant type
          # this flushes out the entire plot
          superset = @connections[[row, col]]
          loop do
            neighbors = superset.map {|neighbor_row, neighbor_col| @connections[[neighbor_row, neighbor_col]]}.inject(&:union) || Set.new
            if (neighbors - superset).empty?
              break
            end

            superset = superset.union(neighbors)
          end

          # save set of addresses in the plot
          @plots[[row, col]] = superset

          # tag each address with the root plot address
          superset.each {
            |key|
            @addresses[key] = [row, col]
          }
        }
      }
    end

    def valid?(row, col)
      (0...@nrows).include?(row) & (0...@ncols).include?(col)
    end

    def fence_price(plot)
      plot.map {
        |row, col|
        [-1,1].map {
          |diff|
          [[row+diff, col], [row, col+diff]].map {
            |test_row, test_col|
            if valid?(test_row, test_col) && plot.include?([test_row, test_col])
              0
            else
              1
            end
          }
        }
      }.flatten.sum * plot.length
    end

    def part_1
      @plots.values.map{|plot| fence_price(plot)}.sum
    end

    def discount_price(plot)
      rowrange = plot.map(&:first).min..plot.map(&:first).max
      colrange = plot.map(&:last).min..plot.map(&:last).max
      ranges = [rowrange, colrange]

      index = [0,1]

      # go across a row looking at the top and bottom edges for space
      # then go down a column, looking at the left and right edges for space
      hold = [index, index.reverse].map {
        |dir_index|
        range1, range2 = ranges.zip(dir_index).sort_by{|a,b| b}.map(&:first)

        range1.map {
          |val1|
          # topbottom then leftright
          [1, -1].map {
            |diff|
            superset = Set.new
        
            range2.each{
              |val2|
              row, col = [val1, val2].zip(dir_index).sort_by{|a,b| b}.map(&:first)
              unless plot.include?([row, col]) then next end

              test_row, test_col = [row, col].zip(dir_index.reverse.map{|x| x*diff}).map{|n, diff| n-diff}

              unless valid?(test_row, test_col) && plot.include?([test_row, test_col])
                superset.add([row, col])
              end
            }

          # condense adjacent spaces into one fence
          # the number of edges is the number of gaps +1
          if superset.length>0
            (superset.each_cons(2).map{
              |a,b| 
              !@connections[a].include?(b)
            }.tally[true] || 0) + 1
          else
            0
          end
          }
        }
      }.flatten.sum * plot.length
    end

    def part_2
      @plots.values.map{|plot| discount_price(plot)}.sum
    end
  end
end

executable = Y2024::Day12.new
executable.run