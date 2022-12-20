require 'rspec'
require '2022/Day20'

RSpec.describe Y2022::Day20 do
    let(:example_data) { 
"1
2
-3
3
-2
0
4"
    }
    let(:subject) { Y2022::Day20.new(example_data) }
    
    describe '#sums grove coordinates after 1 mix' do
        context 'when given example from webpage' do

            it 'produces appropriate count (3)' do
                expect(subject.part_1).to eq 3
            end
        end
    end

    describe '#sums coordinates with decryption' do
        context 'when given example from webpage' do

            it 'produces appropriate count (1623178306)' do
                expect(subject.part_2).to eq 1623178306
            end
        end
    end
end
