require 'rspec'
require '2021/Day02'

RSpec.describe Y2021::Day02 do
    let(:example_data) { 
        "forward 5
        down 5
        forward 8
        up 3
        down 8
        forward 2" 
    }
    let(:subject) { Y2021::Day02.new(example_data) }
    
    describe '#calculates naive movements' do
        context 'when given example from webpage' do

            it 'produces appropriate product (150)' do
                expect(subject.part_1).to eq 150
            end
        end
    end

    describe '#calculates movements with aim logic' do
        context 'when given example from webpage' do

            it 'produces appropriate product (900)' do
                expect(subject.part_2).to eq 900
            end
        end
    end
end
