require 'rspec'
require '2022/Day05'

RSpec.describe Y2022::Day05 do
    let(:example_data) { 
"    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2" 
    }
    let(:subject) { Y2022::Day05.new(example_data) }
    
    describe '#counting entire overlaps' do
        context 'when given example from webpage' do

            it 'produces appropriate count (CMZ)' do
                expect(subject.part_1).to eq 'CMZ'
            end
        end
    end

    describe '#counting partial overlaps' do
        context 'when given example from webpage' do

            it 'produces appropriate count (MCD)' do
                expect(subject.part_2).to eq 'MCD'
            end
        end
    end
end
