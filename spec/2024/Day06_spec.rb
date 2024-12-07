require 'rspec'
require '2024/Day06'

RSpec.describe Y2024::Day06 do
    let(:example) { 
"....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#..." 
    }
    let(:subject) { Y2024::Day06.new(example) }
    
    describe '#guard walks path' do
        context 'when given example from webpage' do

            it 'produces correct position count (41)' do
                expect(subject.part_1).to eq 41
            end

            it 'produces correct stuck options count (6)' do
                expect(subject.part_2).to eq 6
            end
        end
    end
end
