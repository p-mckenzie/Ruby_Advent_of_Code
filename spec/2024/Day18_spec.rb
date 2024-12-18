require 'rspec'
require '2024/Day18'

RSpec.describe Y2024::Day18 do
    let(:example) { 
"5,4
4,2
4,5
3,0
2,1
6,3
2,4
1,5
0,6
3,3
2,6
5,1
1,2
5,5
2,5
6,5
1,4
0,4
6,4
1,1
6,1
1,0
0,5
1,6
2,0"
    }
    let(:subject) { Y2024::Day18.new(example) }
    
    describe '#RAM Run Computer' do
        context 'when given example from webpage' do

            it 'finds shortest path' do
                expect(subject.part_1(0..6, 12)).to eq 22
            end

            it 'finds blocking location' do
                expect(subject.part_2(0..6)).to eq "6,1"
            end
        end
    end
end
