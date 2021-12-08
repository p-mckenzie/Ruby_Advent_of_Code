require 'rspec'
require '2021/Day07'

RSpec.describe Y2021::Day07 do
    let(:example_data) { "16,1,2,0,4,2,7,1,2,14"
    }
    let(:subject) { Y2021::Day07.new(example_data) }
    
    describe '#calculates fuel cost with simple formula' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (37)' do
                expect(subject.part_1).to eq 37
            end
        end
    end

    describe '#calculates fuel cost with advanced formula' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (168)' do
                expect(subject.part_2).to eq 168
            end
        end
    end
end
