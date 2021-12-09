require 'rspec'
require '2021/Day09'

RSpec.describe Y2021::Day09 do
    let(:example_data) { "2199943210
    3987894921
    9856789892
    8767896789
    9899965678"
    }
    let(:subject) { Y2021::Day09.new(example_data) }
    
    describe '#calculates risk level of low points' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (15)' do
                expect(subject.part_1).to eq 15
            end
        end
    end

    describe '#calculates basin sizes of map' do
        context 'when given example from webpage' do

            it 'produces appropriate product (1134)' do
                expect(subject.part_2).to eq 1134
            end
        end
    end
end
