require 'rspec'
require '2022/Day09'

RSpec.describe Y2022::Day09 do
    let(:example_1) { 
"R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2" 
    }

    let(:subject_1) { Y2022::Day09.new(example_1) }
    
    describe '#counts distinct locations tail visits' do
        context 'when given example from webpage' do

            it 'produces appropriate count (13)' do
                expect(subject_1.part_1).to eq 13
            end
            it 'produces appropriate count (1)' do
                expect(subject_1.part_2).to eq 1
            end
        end
    end

    let(:example_2) {
"R 5
U 8
L 8
D 3
R 17
D 10
L 25
U 20"
    }
    let(:subject_2) { Y2022::Day09.new(example_2) }

    describe '#computing viewing distances' do
        context 'when given larger example from webpage' do

            it 'produces appropriate count (36)' do
                expect(subject_2.part_2).to eq 36
            end
        end
    end
end
