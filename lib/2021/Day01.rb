require_relative '../Base.rb'

class Day01 < Base
  @@day = 1
  @@year = 2021

  def initialize(data:nil)
    @data = data ? data : get_data
    @data.map!(&:to_i)
  end

  def triples_sum
    @data.each_cons(3).map(&:sum)
  end

  def count_descending(arr=@data)
    arr.each_cons(2).select {|a,b| a < b }.length
  end

  def run
    puts "----- Day #{@@day} -----"
    puts "Part 1: #{count_descending}"
    puts "Part 2: #{count_descending(triples_sum)}"
    puts
  end
  
end

executable = Day01.new
executable.run