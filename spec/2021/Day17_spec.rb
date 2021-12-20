require 'rspec'
require '2021/Day17'

RSpec.describe Y2021::Day17 do
    let(:example_data) { "target area: x=20..30, y=-10..-5"
    }
    let(:subject) { Y2021::Day17.new(example_data) }
    
    describe '#calculates highest y-position' do
        context 'when given example from webpage' do

            it 'produces appropriate y-value (45)' do
                expect(subject.part_1).to eq 45
            end
        end
    end

    describe '#calculates number of valid starting velocities' do
        context 'when given example from webpage' do

            it 'produces appropriate count (112)' do
                expect(subject.part_2).to eq 112
            end
        end
    end
end
