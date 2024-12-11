require 'rspec'
require '2024/Day11'

RSpec.describe Y2024::Day11 do
    let(:example) { 
"125 17" 
    }
    let(:subject) { Y2024::Day11.new(example) }
    
    describe '#counts stones' do
        context 'when given example from webpage' do

            it 'blinks 25 times (55312)' do
                expect(subject.part_1).to eq 55312
            end
        end
    end
end
