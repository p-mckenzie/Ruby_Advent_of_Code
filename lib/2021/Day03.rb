require_relative '../Base.rb'

module Y2021
  class Day03 < Base
    @@day = 3
    @@year = 2021

    def initialize(data=get_data)
      @data = data.split

      main
    end

    def count_occurrences(data)
      counts = Hash.new { |h, k| h[k] = Hash.new(0) }
      data.each {
        |binary_number|
        binary_number.split('').each_with_index { 
          |bit, index|
          counts[index][bit] += 1
        }
      }

      counts
    end

    def hash_key_with_max_value(hash)
      sorted_keys = hash.keys.sort_by {|key| -hash[key]}
      hash.values.uniq.length==1 ? 1 : sorted_keys[0]
    end

    def hash_key_with_min_value(hash)
      sorted_keys = hash.keys.sort_by {|key| hash[key]}
      hash.values.uniq.length==1 ? 0 : sorted_keys[0]
    end

    def get_max_or_min(hash, max=true)
      hash.map{|key,hash| max ? hash_key_with_max_value(hash) : hash_key_with_min_value(hash) }
    end

    def filter_by(max=true)
      candidates = @data.clone
      i = 0
      while candidates.length>1 do
        counts = count_occurrences(candidates)
        filter = get_max_or_min(counts, max)
        candidates.select! {|x| x[i]==filter[i].to_s}
        i += 1
      end
      candidates[0]
    end

    def binary_to_int(s)
      if s.is_a?(Array) then s = s.join('') end
      s.to_i(2)
    end

    def main
      counts = count_occurrences(@data)
      @gamma = get_max_or_min(counts)
      @epsilon = get_max_or_min(counts, false)

      @life_support = filter_by
      @oxygen = filter_by(false)
      end

    def part_1
      binary_to_int(@gamma) * binary_to_int(@epsilon)
    end

    def part_2
      binary_to_int(@life_support) * binary_to_int(@oxygen)
    end  
  end
end

executable = Y2021::Day03.new
executable.run