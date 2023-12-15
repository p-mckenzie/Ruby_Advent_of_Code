require 'rspec'
require '2023/Day11'

RSpec.describe Y2023::Day11 do
    let(:example) { 
"...#......
.......#..
#.........
..........
......#...
.#........
.........#
..........
.......#..
#...#....." 
    }
    let(:subject) { Y2023::Day11.new(example) }
    
    describe '#calculates galaxies distances' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (374)' do
                expect(subject.part_1).to eq 374
            end

            it 'produces appropriate sum (1030)' do
                expect(subject.part_2(by=10)).to eq 1030
            end

            it 'produces appropriate sum (8410)' do
                expect(subject.part_2(by=100)).to eq 8410
            end
        end
    end
end
