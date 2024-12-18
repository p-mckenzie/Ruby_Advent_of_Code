require 'rspec'
require '2024/Day16'

RSpec.describe Y2024::Day16 do
    let(:example) { 
"#################
#...#...#...#..E#
#.#.#.#.#.#.#.#.#
#.#.#.#...#...#.#
#.#.#.#.###.#.#.#
#...#.#.#.....#.#
#.#.#.#.#.#####.#
#.#...#.#.#.....#
#.#.#####.#.###.#
#.#.#.......#...#
#.#.###.#####.###
#.#.#...#.....#.#
#.#.#.#####.###.#
#.#.#.........#.#
#.#.#.#########.#
#S#.............#
#################"
    }
    let(:subject) { Y2024::Day16.new(example) }
    
    describe '#reindeer olympics' do
        context 'when given example from webpage' do

            it 'finds best path (11048)' do
                expect(subject.part_1).to eq 11048
            end

            it 'finds locations on best paths (64)' do
                expect(subject.part_2).to eq 64
            end
        end
    end
end
