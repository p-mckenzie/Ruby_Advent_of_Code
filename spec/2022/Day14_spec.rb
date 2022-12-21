require 'rspec'
require '2022/Day14'

RSpec.describe Y2022::Day14 do
    let(:example_data) { 
"498,4 -> 498,6 -> 496,6
503,4 -> 502,4 -> 502,9 -> 494,9"
    }
    let(:subject) { Y2022::Day14.new(example_data) }
    
    describe '#counts sand dropped before map is full' do
        context 'when given example from webpage' do

            it 'produces appropriate count (24)' do
                expect(subject.part_1).to eq 24
            end
        end
    end

    describe '#sums coordinates with decryption' do
        context 'when given example from webpage' do

            it 'produces appropriate count (93)' do
                expect(subject.part_2).to eq 93
            end
        end
    end
end
