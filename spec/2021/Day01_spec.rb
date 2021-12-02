require 'rspec'
require '2021/Day01'

RSpec.describe Y2021::Day01 do
    let(:example_data) { 
        "199
        200
        208
        210
        200
        207
        240
        269
        260
        263" 
    }
    let(:subject) { Y2021::Day01.new(example_data) }
    
    describe '#counts number of depth increases' do
        context 'when given example from webpage' do

            it 'produces appropriate count (7)' do
                expect(subject.part_1).to eq 7
            end
        end
    end

    describe '#counts number of depth increases by threesums' do
        context 'when given example from webpage' do

            it 'produces appropriate count (7)' do
                expect(subject.part_2).to eq 5
            end
        end
    end
end
