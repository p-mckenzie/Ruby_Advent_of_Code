require 'rspec'
require '2024/Day14'

RSpec.describe Y2024::Day14 do
    let(:example) { 
"p=0,4 v=3,-3
p=6,3 v=-1,-3
p=10,3 v=-1,2
p=2,0 v=2,-1
p=0,0 v=1,3
p=3,0 v=-2,-2
p=7,6 v=-1,-3
p=3,0 v=-1,-2
p=9,3 v=2,3
p=7,3 v=-1,2
p=2,4 v=2,-3
p=9,5 v=-3,-3"
    }
    let(:subject) { Y2024::Day14.new(example) }
    
    describe '#moves robots' do
        context 'when given example from webpage' do

            it 'moves 100x (12)' do
                expect(subject.part_1(11, 7)).to eq 12
            end
        end
    end
end
