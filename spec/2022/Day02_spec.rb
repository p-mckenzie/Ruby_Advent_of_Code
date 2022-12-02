require 'rspec'
require '2022/Day02'

RSpec.describe Y2022::Day02 do
    let(:example_data) { 
"A Y
B X
C Z" 
    }
    let(:subject) { Y2022::Day02.new(example_data) }
    
    describe '#produces score under move instructions' do
        context 'when given example from webpage' do

            it 'produces appropriate count (15)' do
                expect(subject.part_1).to eq 15
            end
        end
    end

    describe '#produces score under result instructions' do
        context 'when given example from webpage' do

            it 'produces appropriate count (12)' do
                expect(subject.part_2).to eq 12
            end
        end
    end
end
