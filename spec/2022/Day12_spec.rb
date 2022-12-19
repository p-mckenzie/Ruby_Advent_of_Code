require 'rspec'
require '2022/Day12'

RSpec.describe Y2022::Day12 do
    let(:example_data) { 
"Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi" 
    }
    let(:subject) { Y2022::Day12.new(example_data) }
    
    describe '#finds shortest path' do
        context 'when given example from webpage' do

            it 'produces appropriate count (31)' do
                expect(subject.part_1).to eq 31
            end
        end
    end

    describe '#finds the shortest path from any starting point' do
        context 'when given example from webpage' do

            it 'produces appropriate count (29)' do
                expect(subject.part_2).to eq 29
            end
        end
    end
end
