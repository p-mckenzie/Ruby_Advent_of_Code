require 'rspec'
require '2022/Day07'

RSpec.describe Y2022::Day07 do
    let(:example_data) { 
"$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k" 
    }
    let(:subject) { Y2022::Day07.new(example_data) }
    
    describe '#sums directories with less than 100000 storage' do
        context 'when given example from webpage' do

            it 'produces appropriate count (95437)' do
                expect(subject.part_1).to eq 95437
            end
        end
    end

    describe '#counting partial overlaps' do
        context 'when given example from webpage' do

            it 'produces appropriate count (24933642)' do
                expect(subject.part_2).to eq 24933642
            end
        end
    end
end
