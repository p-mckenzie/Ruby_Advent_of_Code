require 'rspec'
require '2023/Day14'

RSpec.describe Y2023::Day14 do
    let(:example) { 
"O....#....
O.OO#....#
.....##...
OO.#O....O
.O.....O#.
O.#..O.#.#
..O..#O..O
.......O..
#....###..
#OO..#...." 
    }
    let(:subject) { Y2023::Day14.new(example) }

    describe '#tilt is correct' do
        it 'moves O to the start with no blockers' do
            arr = ['.', 'O']
            expect(subject.tilt(arr)).to eq ['O', '.']
        end
        it 'moves multiple O to the start with no blockers' do
            arr = ['.', 'O', '.', 'O']
            expect(subject.tilt(arr)).to eq ['O', 'O', '.', '.']
        end
        it 'moves O to the first #' do
            arr = ['.', '#', '.', 'O']
            expect(subject.tilt(arr)).to eq ['.', '#', 'O', '.']
        end
        it 'moves multiple O to the first #' do
            arr = ['.', '#', '.', 'O', '.', 'O']
            expect(subject.tilt(arr)).to eq ['.', '#', 'O', 'O', '.', '.']
        end
        it 'moves multiple O to their #' do
            arr = ['.', '#', '.', 'O', '#', 'O']
            expect(subject.tilt(arr)).to eq ['.', '#', 'O', '.', '#', 'O']
        end
        it 'moves multiple O to their # advanced' do
            arr = ['.', '#', '.', 'O', '#', 'O', '.', 'O', '#', '.', '.', '#', 'O']
            expect(subject.tilt(arr)).to eq ['.', '#', 'O', '.', '#', 'O', 'O', '.', '#', '.','.','#','O']
        end
    end
    
    describe '#calculates load' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (136)' do
                expect(subject.part_1).to eq 136
            end

            it 'produces appropriate sum (64)' do
                expect(subject.part_2).to eq 64
            end
        end
    end
end
