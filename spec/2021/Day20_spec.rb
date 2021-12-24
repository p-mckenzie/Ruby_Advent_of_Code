require 'rspec'
require '2021/Day20'

RSpec.describe Y2021::Day20 do
    let(:example_data) { 
"..#.#..#####.#.#.#.###.##.....###.##.#..###.####..#####..#....#..#..##..###..######.###...####..#..#####..##..#.#####...##.#.#..#.##..#.#......#.###.######.###.####...#.##.##..#..#..#####.....#.#....###..#.##......#.....#..#..#..##..#...##.######.####.####.#.#...#.......#..#.#.#...####.##.#......#..#...##.#.##..#...##.#.##..###.#......#.#.......#.#.#.####.###.##...#.....####.#..#..#.##.#....##..#.####....##...##..#...#......#.#.......#.......##..####..#...#.#.#...##..#.#..###..#####........#..####......#..#

#..#.
#....
##..#
..#..
..###"
    }
    let(:subject) { Y2021::Day20.new(example_data) }
    
    describe "#calculates lit elements after 2 rounds" do
        context 'when given example from webpage' do

            it 'produces appropriate count (35)' do
                expect(subject.part_1).to eq 35
            end
        end
    end

    describe "#calculates lit elements after 50 rounds" do
        context 'when given example from webpage' do

            it 'produces appropriate count (3351)' do
                expect(subject.part_2).to eq 3351
            end
        end
    end
end