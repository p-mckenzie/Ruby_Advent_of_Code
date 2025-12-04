require 'rspec'
require '2025/Day03'

RSpec.describe Y2025::Day03 do
    let(:example) { 
"987654321111111
811111111111119
234234234234278
818181911112111" 
    }
    let(:subject) { Y2025::Day03.new(example) }
    
    describe '#finds joltage' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (357)' do
                expect(subject.part_1).to eq 357
            end

            it 'produces more complicated sum (3121910778619)' do
                expect(subject.part_2).to eq 3121910778619
            end
        end
    end
end
