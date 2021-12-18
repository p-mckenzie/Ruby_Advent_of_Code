require 'rspec'
require '2021/Day15'

RSpec.describe Y2021::Day15 do
    let(:example_data) { 
"1163751742
1381373672
2136511328
3694931569
7463417111
1319128137
1359912421
3125421639
1293138521
2311944581" 
    }
    let(:subject) { Y2021::Day15.new(example_data) }
    
    describe '#calculates risk of short path' do
        context 'when given example from webpage' do

            it 'produces appropriate count (40)' do
                expect(subject.part_1).to eq 40
            end
        end
    end

    describe '#calculates risk of extended path' do
        context 'when given example from webpage' do

            it 'produces appropriate count (315)' do
                expect(subject.part_2).to eq 315
            end
        end
    end
end
