require_relative '../Base'

module Y2024
  class Day05 < Base
    @@day = 5
    @@year = 2024

    def initialize(data=get_data)
      rules, pages = data.split("\n\n")

      @above = Hash.new { |hash, key| hash[key] = [] }
      @below = Hash.new { |hash, key| hash[key] = [] }
      rules.split.each{
        |txt| 
        bottom, top = txt.split("|").map(&:to_i)
        @above[bottom].push(top)
        @below[top].push(bottom)
      }

      pages = pages.split.map{|txt| txt.split(",").map(&:to_i)}
      sorted_pages = pages.map(&method(:reorder_pages))

      @part_1, @part_2 = 0, 0
      pages.zip(sorted_pages).map {
        |og, sorted|
        if og==sorted
          @part_1 += og[og.length/2]
        else
          @part_2 += sorted[sorted.length/2]
        end
      }.sum
    end

    def reorder_pages(page)
      page = page.clone
      page.each_with_index.map{
        |number, index|
          page[index+1...page.length].intersection(@below[number]).each {
            |to_move|
            page.delete(to_move)
            target_index = @above[to_move].map{|n| page.index(n)}.compact.min
            if target_index
              page.insert(target_index, to_move)
            end
          }
      }
      page
    end

    def part_1
      @part_1
    end

    def part_2
      @part_2
    end
  end
end

executable = Y2024::Day05.new
executable.run