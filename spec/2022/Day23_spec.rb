require 'rspec'
require '2022/Day23'

RSpec.describe Y2022::Day23 do
    let(:example_data) { 
"..............
..............
.......#......
.....###.#....
...#...#.#....
....#...##....
...#.###......
...##.#.##....
....#..#......
..............
..............
.............." 
    }
    let(:subject) { Y2022::Day23.new(example_data) }
    
    describe '#moves elves for 10 rounds' do
        context 'when given example from webpage' do

            it 'produces appropriate count (110)' do
                expect(subject.part_1).to eq 110
            end
        end
    end

    describe '#finds the round where elves stop moving' do
        context 'when given example from webpage' do

            it 'produces appropriate count (20)' do
                expect(subject.part_2).to eq 20
            end
        end
    end
end
