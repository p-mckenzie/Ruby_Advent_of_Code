require 'rspec'
require '2021/Day05'

RSpec.describe Y2021::Day05 do
    let(:example_data) { 
"0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
2,2 -> 2,1
7,0 -> 7,4
6,4 -> 2,0
0,9 -> 2,9
3,4 -> 1,4
0,0 -> 8,8
5,5 -> 8,2" 
    }
    let(:subject) { Y2021::Day05.new(example_data) }
    
    describe '#calculates horizontal/vertical' do
        context 'when given example from webpage' do

            it 'produces appropriate count (5)' do
                expect(subject.part_1).to eq 5
            end
        end
    end

    describe '#calculates horizontal/vertical/diagonal' do
        context 'when given example from webpage' do

            it 'produces appropriate count (12)' do
                expect(subject.part_2).to eq 12
            end
        end
    end
end
