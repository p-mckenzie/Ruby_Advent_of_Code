require 'rspec'
require '2023/Day21'

RSpec.describe Y2023::Day21 do
    let(:example) { 
"...........
.....###.#.
.###.##..#.
..#.#...#..
....#.#....
.##..S####.
.##..#...#.
.......##..
.##.#.####.
.##..##.##.
..........." 
    }
    
    let(:subject) { Y2023::Day21.new(example) }
    
    describe '#walks to gardens' do
        context 'when given example from webpage' do

            it 'produces appropriate count (16)' do
                expect(subject.part_1(6)).to eq 16
            end
        end
    end
end
