require_relative '../Base.rb'

module Y2021
  class Day22 < Base
    @@day = 22
    @@year = 2021

    def initialize(data=get_data)
      @data = data
      @rects = Hash.new(false)

      main
      
    end

    def main
      # for each new rect (rect2):
      # add to existing list of rects
      # check each existing rect (rect1) and, 
      # if overlap:
      #   remove rect1 from overall list
      #   add segments of rect1 surrounding rect2 to overall
      # else, keep rect1 in overall list
      @data.split("\n").each {
        |row|
        switch = (row.split[0] == 'on')
        rect = pad(row.scan(/[-\d]+/).map(&:to_i))
        
        updated_rects = Hash.new(false)
        updated_rects[rect] = switch

        @rects.each {
          |compare_rect, compare_switch|

          if intersects(rect, compare_rect) then
            segment_box(compare_rect, rect).each {
              |new_rect|
              updated_rects[new_rect] = compare_switch
            }
          else
            updated_rects[compare_rect] = compare_switch
          end
          
        }
        @rects = updated_rects
      }

      @part_1 = @rects.select{|key,val| val}.map {
        |cube, val|
        volume(limit(cube))
      }.sum

      @part_2 = @rects.select{|key,val| val}.map {
        |cube, val|
        volume(cube)
      }.sum

    end

    def limit(rect)
      # limits rectangle to the -50,50 span
      rect.map {|element| [[element, -50].max, 50+1].min}
    end

    def pad(rect)
      # pads the "max" side of each axis 
      # each axis is now [inclusive, exclusive)
      (0..2).each {
        |axis|
        rect[axis*2+1] += 1
      }
      rect
    end

    def segment_box(rect1, rect2)
      rect1_xmin, rect1_xmax, rect1_ymin, rect1_ymax, rect1_zmin, rect1_zmax = rect1
      rect2_xmin, rect2_xmax, rect2_ymin, rect2_ymax, rect2_zmin, rect2_zmax = rect2
  
      # Limit rect2 to the bounds of rect1
      rect2_xmin = [rect1_xmin, rect2_xmin].max
      rect2_ymin = [rect1_ymin, rect2_ymin].max
      rect2_zmin = [rect1_zmin, rect2_zmin].max
      rect2_xmax = [rect1_xmax, rect2_xmax].min
      rect2_ymax = [rect1_ymax, rect2_ymax].min
      rect2_zmax = [rect1_zmax, rect2_zmax].min
      
      # segment rect1 AROUND newly-limited rect2
      segmented_cubes = [
        [rect1_xmin, rect1_xmax, rect1_ymin, rect1_ymax, rect1_zmin, rect2_zmin],
        [rect1_xmin, rect1_xmax, rect1_ymin, rect1_ymax, rect2_zmax, rect1_zmax],
        [rect2_xmin, rect1_xmax, rect1_ymin, rect2_ymin, rect2_zmin, rect2_zmax],
        [rect2_xmax, rect1_xmax, rect2_ymin, rect1_ymax, rect2_zmin, rect2_zmax],
        [rect1_xmin, rect2_xmax, rect2_ymax, rect1_ymax, rect2_zmin, rect2_zmax],
        [rect1_xmin, rect2_xmin, rect1_ymin, rect2_ymax, rect2_zmin, rect2_zmax],
      ]

      # return newly-segmented cubes
      segmented_cubes.select { |cube| is_valid(cube) }
    end

    def is_valid(rect)
      (0..2).each {
        |axis|
        rect[axis*2]<=rect[axis*2+1]
      }.all? && (volume(rect)>0)
    end

    def volume(rect)
      (0..2).map {
        |axis|
        rect[axis*2+1] - rect[axis*2]
      }.inject(:*)
    end

    def intersects(rect1, rect2)
      # checks if two cubes intersect
      (0..2).map {
        |axis|
        max_of_mins = [rect1[axis*2], rect2[axis*2]].max
        min_of_maxes = [rect1[axis*2+1], rect2[axis*2+1]].min

        # is there overlap?
        min_of_maxes>=max_of_mins
    }.all?
    end

    def part_1
      @part_1
    end

    def part_2
      @part_2
    end
  end
end

executable = Y2021::Day22.new
executable.run