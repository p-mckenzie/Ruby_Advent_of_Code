require 'rspec'
require '2023/Day13'

RSpec.describe Y2023::Day13 do
    let(:example) { 
"#.##..##.
..#.##.#.
##......#
##......#
..#.##.#.
..##..##.
#.#.##.#.

#...##..#
#....#..#
..##..###
#####.##.
#####.##.
..##..###
#....#..#" 
    }
    let(:subject) { Y2023::Day13.new(example) }
    
    describe '#calculates reflection options' do
        context 'when given example from webpage' do

            it 'produces appropriate number (405)' do
                expect(subject.part_1).to eq 405
            end

            it 'produces appropriate number (400)' do
                expect(subject.part_2).to eq 400
            end
        end
    end
end
