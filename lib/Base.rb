class Base
    @@day = 
    @@year = 
    
    def get_data
        File.read(File.join(File.dirname(__FILE__), "../public/#{@@year}/day#{@@day}.txt"))
    end
    
    def run
        puts "----- Day #{@@day} -----"
        puts "Part 1: #{part_1}"
        puts "Part 2: #{part_2}"
        puts
    end
end