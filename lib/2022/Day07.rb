require_relative '../Base'

module Y2022
  class File
    attr_accessor :name, :size
    
    def initialize(name:, size:)
      @name = name
      @size = size
    end
  end

  class Directory
    attr_accessor :name, :contents, :parent
    
    def initialize(name:, contents:[], parent:nil)
      @name = name
      @contents = contents
      @parent = parent
    end

    def size
      @contents.map(&:size).sum
    end

    def sub_directories
      @contents.select {|item| item.is_a?(Directory) }
    end

    def files
      @contents.select {|item| item.is_a?(File) }
    end
  end


  class Day07 < Base
    @@day = 7
    @@year = 2022

    def initialize(data=get_data)
      commands = data.split("$").map{|cmd| cmd.strip.split("\n")}
      @root = Directory.new(name:'/')

      current_directory = @root

      commands.each do
        |command|
        if command.empty? then 
          next 
        end
        
        user_input, param = command[0].split
        output = command[1..]

        case user_input
        when 'cd'
          # change directory
          case param
          when '/'
            # go to root
            current_directory = @root
          when '..'
            # go up
            current_directory = current_directory.parent
          else
            # go to specific directory
            target = current_directory.contents.select {|dir| dir.name == param}.first
            target ||= Directory.new(name:param, parent:current_directory)
            current_directory = target
          end
        when 'ls'
          # list directory
          unless current_directory.contents.empty? then
            next
          end

          current_directory.contents = output.map do
            |line|
            type, name = line.split
            if type=='dir' then
              Directory.new(name:name, parent:current_directory)
            else
              File.new(name:name, size:type.to_i)
            end
          end
        else
          raise
        end
      end
    end

    def update_sum(dir)
      @sum_smol_directories ||= 0
      if dir.size<=100000 then
        @sum_smol_directories += dir.size
      end
      dir.sub_directories.each {|sub_dir| update_sum(sub_dir)}
    end

    def part_1
      update_sum(@root)
      @sum_smol_directories
    end

    def frees_up_space(dir)
      @dir_to_delete ||= @root
      if dir.size + @free_space >= 30000000 then
        if dir.size < @dir_to_delete.size then
          @dir_to_delete = dir
        end
        dir.sub_directories.each {|sub_dir| frees_up_space(sub_dir)}
      end
    end

    def part_2
      @free_space = 70000000 - @root.size
      frees_up_space(@root)
      @dir_to_delete.size
    end
  end
end

executable = Y2022::Day07.new
executable.run