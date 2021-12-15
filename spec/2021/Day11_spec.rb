require 'rspec'
require '2021/Day11'

RSpec.describe Y2021::Day11 do
    let(:example_data) { "5483143223
    2745854711
    5264556173
    6141336146
    6357385478
    4167524645
    2176841721
    6882881134
    4846848554
    5283751526"
    }
    let(:subject) { Y2021::Day11.new(example_data) }
    
    describe '#calculates number of octopi flashing' do
        context 'when given example from webpage' do

            it 'produces appropriate count (1656)' do
                expect(subject.part_1).to eq 1656
            end
        end
    end

    describe '#finds first time when all octopi flash' do
        context 'when given example from webpage' do

            it 'produces appropriate time period (195)' do
                expect(subject.part_2).to eq 195
            end
        end
    end
end
