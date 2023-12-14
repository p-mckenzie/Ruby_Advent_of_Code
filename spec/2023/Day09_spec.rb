require 'rspec'
require '2023/Day09'

RSpec.describe Y2023::Day09 do
    let(:example) { 
"0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45" 
    }
    let(:subject) { Y2023::Day09.new(example) }
    
    describe '#calculates OASIS reading' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (114)' do
                expect(subject.part_1).to eq 114
            end

            it 'produces appropriate sum (2)' do
                expect(subject.part_2).to eq 2
            end
        end
    end
end
