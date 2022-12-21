require 'rspec'
require '2022/Day17'

RSpec.describe Y2022::Day17 do
    let(:example_data) { 
">>><<><>><<<>><>>><<<>>><<<><<<>><>><<>>" 
    }
    let(:subject) { Y2022::Day17.new(example_data) }
    
    describe '#counts height after 2022 blocks' do
        context 'when given example from webpage' do

            it 'produces appropriate count (3068)' do
                expect(subject.part_1).to eq 3068
            end
        end
    end

    describe '#counts height after 1000000000000 blocks' do
        context 'when given example from webpage' do

            it 'produces appropriate count (1514285714288)' do
                expect(subject.part_2).to eq 1514285714288
            end
        end
    end
end
