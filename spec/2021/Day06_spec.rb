require 'rspec'
require '2021/Day06'

RSpec.describe Y2021::Day06 do
    let(:example_data) { "3,4,3,1,2"
    }
    let(:subject) { Y2021::Day06.new(example_data) }
    
    describe '#calculates breeding rate over short term' do
        context 'when given example from webpage' do

            it 'produces appropriate count (5934)' do
                expect(subject.part_1).to eq 5934
            end
        end
    end

    describe '#calculates breeding rate over long term' do
        context 'when given example from webpage' do

            it 'produces appropriate count (26984457539)' do
                expect(subject.part_2).to eq 26984457539
            end
        end
    end
end
