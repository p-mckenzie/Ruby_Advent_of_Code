require 'rspec'
require '2021/Day03'

RSpec.describe Y2021::Day03 do
    let(:example_data) { 
        "00100
        11110
        10110
        10111
        10101
        01111
        00111
        11100
        10000
        11001
        00010
        01010" 
    }
    let(:subject) { Y2021::Day03.new(example_data) }
    
    describe '#calculates naive movements' do
        context 'when given example from webpage' do

            it 'produces appropriate product (198)' do
                expect(subject.part_1).to eq 198
            end
        end
    end

    describe '#calculates movements with aim logic' do
        context 'when given example from webpage' do

            it 'produces appropriate product (230)' do
                expect(subject.part_2).to eq 230
            end
        end
    end
end
