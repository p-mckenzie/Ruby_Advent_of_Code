require 'rspec'
require '2022/Day13'

RSpec.describe Y2022::Day13 do
    let(:example_data) { 
"[1,1,3,1,1]
[1,1,5,1,1]

[[1],[2,3,4]]
[[1],4]

[9]
[[8,7,6]]

[[4,4],4,4]
[[4,4],4,4,4]

[7,7,7,7]
[7,7,7]

[]
[3]

[[[]]]
[[]]

[1,[2,[3,[4,[5,6,7]]]],8,9]
[1,[2,[3,[4,[5,6,0]]]],8,9]"
    }
    let(:subject) { Y2022::Day13.new(example_data) }
    
    describe '#sums correct indices' do
        context 'when given example from webpage' do

            it 'produces appropriate count (13)' do
                expect(subject.part_1).to eq 13
            end
        end
    end

    describe '#sorts and identifies divider packets' do
        context 'when given example from webpage' do

            it 'produces appropriate count (140)' do
                expect(subject.part_2).to eq 140
            end
        end
    end
end
