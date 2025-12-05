require 'rspec'
require '2025/Day05'

RSpec.describe Y2025::Day05 do
    let(:example) { 
"3-5
10-14
16-20
12-18

1
5
8
11
17
32" 
    }
    let(:subject) { Y2025::Day05.new(example) }
    
    describe '#does inventory' do
        context 'when given example from webpage' do

            it 'counts fresh ingredients (3)' do
                expect(subject.part_1).to eq 3
            end

            it 'counts fresh ids (14)' do
                expect(subject.part_2).to eq 14
            end
        end
    end
end
