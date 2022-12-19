require_relative '../Base'
require 'set'

module Y2022
  class Day18 < Base
    @@day = 18
    @@year = 2022

    def initialize(data=get_data)
      @cubes = data.split.map{|line|line.split(',').map(&:to_i)}

      @limits = (0..2).map {|dim| @cubes.map{|cube| cube[dim]}.minmax}.map{|min,max| [min-1,max+1]}
    end

    def in_range?(cube)
      (0..2).map {|dim| @limits[dim][0] <= cube[dim] and @limits[dim][1] >= cube[dim]}.all?
    end

    def surfaces(cube)
      [-1,1].map {
        |offset|
        (0..2).map {
          |dim|
          new_cube = cube.clone
          new_cube[dim] += offset
          new_cube
        }.compact
    }.flatten(1)
    end

    def part_1
      # how many times did a cube have a surface that isn't adjacent to another cube?
      empty_surfaces = Hash.new { 0 }

      # visit each cube's surfaces, and log the visit if it's not another cube
      @cubes.each {|cube| 
        surfaces(cube).each {
          |surface|
          unless @cubes.include?(surface) then
            empty_surfaces[surface] += 1
          end
          }
      }
      empty_surfaces.values.sum
    end

    def part_2
      # start with free air, visit all neighbors
      # if the neighbor is a cube, log as an external surface
      # else, it's also free air - repeat
      external_surfaces = 0
  
      to_process = [@limits.map(&:first)]
      processed = to_process.to_set
  
      while to_process.any?
        cube = to_process.pop
        surfaces(cube).each do 
          |surface|
          next if processed.include?(surface) or !in_range?(surface)
          if @cubes.include?(surface)
              external_surfaces += 1
          else
            to_process << surface
            processed.add(surface)
          end
        end
      end
      external_surfaces
    end
  end
end

executable = Y2022::Day18.new
executable.run
