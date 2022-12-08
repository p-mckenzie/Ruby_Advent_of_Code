require 'rspec'
require '2022/Day08'

RSpec.describe Y2022::Day08 do
    let(:example_data) { 
"30373
25512
65332
33549
35390" 
    }
    let(:subject) { Y2022::Day08.new(example_data) }
    
    describe '#counts visible trees' do
        context 'when given example from webpage' do

            it 'produces appropriate count (21)' do
                expect(subject.part_1).to eq 21
            end
        end
    end

    describe '#computing viewing distances' do
        context 'when given example from webpage' do

            it 'produces appropriate count (8)' do
                expect(subject.part_2).to eq 8
            end
        end
    end
end
