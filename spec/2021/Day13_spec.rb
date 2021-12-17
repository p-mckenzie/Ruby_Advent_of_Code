require 'rspec'
require '2021/Day13'

RSpec.describe Y2021::Day13 do
    let(:example_data) { 
"6,10
0,14
9,10
0,3
10,4
4,11
6,0
6,12
4,1
0,13
10,12
3,4
3,0
8,4
1,10
2,14
8,10
9,0

fold along y=7
fold along x=5" 
    }
    let(:subject) { Y2021::Day13.new(example_data) }
    
    describe '#calculates number of dots after single fold' do
        context 'when given example from webpage' do

            it 'produces appropriate product (17)' do
                expect(subject.part_1).to eq 17
            end
        end
    end

    describe '#completes all folds successfully' do
        context 'when given example from webpage' do

            it 'produces text' do
                expect(subject.part_2).to be_a(String)
            end
        end
    end
end
