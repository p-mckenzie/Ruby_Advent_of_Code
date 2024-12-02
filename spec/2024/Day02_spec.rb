require 'rspec'
require '2024/Day02'

RSpec.describe Y2024::Day02 do
    let(:example) { 
"7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9" 
    }
    let(:subject) { Y2024::Day02.new(example) }
    
    describe '#finds safe sets' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (2)' do
                expect(subject.part_1).to eq 2
            end

            it 'produces appropriate dampened sum (4)' do
                expect(subject.part_2).to eq 4
            end
        end
    end
end
