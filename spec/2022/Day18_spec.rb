require 'rspec'
require '2022/Day18'

RSpec.describe Y2022::Day18 do
    let(:example_data) { 
"2,2,2
1,2,2
3,2,2
2,1,2
2,3,2
2,2,1
2,2,3
2,2,4
2,2,6
1,2,5
3,2,5
2,1,5
2,3,5" 
    }
    let(:subject) { Y2022::Day18.new(example_data) }
    
    describe '#counts surface area of unconnected cubes' do
        context 'when given example from webpage' do

            it 'produces appropriate count (64)' do
                expect(subject.part_1).to eq 64
            end
        end
    end

    describe '#ignores interior space' do
        context 'when given example from webpage' do

            it 'produces appropriate count (58)' do
                expect(subject.part_2).to eq 58
            end
        end
    end
end
