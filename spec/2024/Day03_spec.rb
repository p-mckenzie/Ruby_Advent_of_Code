require 'rspec'
require '2024/Day03'

RSpec.describe Y2024::Day03 do
    let(:example_1) { 
"xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))" 
    }
    let(:subject_1) { Y2024::Day03.new(example_1) }
    
    describe '#finds correct memory sets' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (161)' do
                expect(subject_1.part_1).to eq 161
            end
        end
    end

    let(:example_2) { 
"xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))" 
    }
    let(:subject_2) { Y2024::Day03.new(example_2) }

    describe '#turns them on and off' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (48)' do
                expect(subject_2.part_2).to eq 48
            end
        end
    end
end
