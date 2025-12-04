require 'rspec'
require '2025/Day04'

RSpec.describe Y2025::Day04 do
    let(:example) { 
"..@@.@@@@.
@@@.@.@.@@
@@@@@.@.@@
@.@@@@..@.
@@.@@@@.@@
.@@@@@@@.@
.@.@.@.@@@
@.@@@.@@@@
.@@@@@@@@.
@.@.@@@.@." 
    }
    let(:subject) { Y2025::Day04.new(example) }
    
    describe '#moves rolls of paper' do
        context 'when given example from webpage' do

            it 'counts accessible rolls (13)' do
                expect(subject.part_1).to eq 13
            end

            it 'removes all feasible rolls (43)' do
                expect(subject.part_2).to eq 43
            end
        end
    end
end
