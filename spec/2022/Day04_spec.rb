require 'rspec'
require '2022/Day04'

RSpec.describe Y2022::Day04 do
    let(:example_data) { 
"2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8" 
    }
    let(:subject) { Y2022::Day04.new(example_data) }
    
    describe '#counting entire overlaps' do
        context 'when given example from webpage' do

            it 'produces appropriate count (2)' do
                expect(subject.part_1).to eq 2
            end
        end
    end

    describe '#counting partial overlaps' do
        context 'when given example from webpage' do

            it 'produces appropriate count (4)' do
                expect(subject.part_2).to eq 4
            end
        end
    end
end
