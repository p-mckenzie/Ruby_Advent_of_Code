require 'rspec'
require '2022/Day21'

RSpec.describe Y2022::Day21 do
    let(:example_data) { 
"root: pppw + sjmn
dbpl: 5
cczh: sllz + lgvd
zczc: 2
ptdq: humn - dvpt
dvpt: 3
lfqf: 4
humn: 5
ljgn: 2
sjmn: drzm * dbpl
sllz: 4
pppw: cczh / lfqf
lgvd: ljgn * ptdq
drzm: hmdt - zczc
hmdt: 32"
    }
    let(:subject) { Y2022::Day21.new(example_data) }
    
    describe '#finds what the root monkey yells' do
        context 'when given example from webpage' do

            it 'produces appropriate count (152)' do
                expect(subject.part_1).to eq 152
            end
        end
    end

    describe '#finds what you should yell' do
        context 'when given example from webpage' do

            it 'produces appropriate count (301)' do
                expect(subject.part_2).to eq 301
            end
        end
    end
end
