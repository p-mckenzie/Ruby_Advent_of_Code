require 'rspec'
require '2022/Day11'

RSpec.describe Y2022::Day11 do
    let(:example_data) { 
"Monkey 0:
Starting items: 79, 98
Operation: new = old * 19
Test: divisible by 23
  If true: throw to monkey 2
  If false: throw to monkey 3

Monkey 1:
Starting items: 54, 65, 75, 74
Operation: new = old + 6
Test: divisible by 19
  If true: throw to monkey 2
  If false: throw to monkey 0

Monkey 2:
Starting items: 79, 60, 97
Operation: new = old * old
Test: divisible by 13
  If true: throw to monkey 1
  If false: throw to monkey 3

Monkey 3:
Starting items: 74
Operation: new = old + 3
Test: divisible by 17
  If true: throw to monkey 0
  If false: throw to monkey 1" 
    }
    let(:subject) { Y2022::Day11.new(example_data) }
    
    describe '#counts monkey business' do
        context 'when given example from webpage' do

            it 'produces appropriate count (10605)' do
                expect(subject.part_1).to eq 10605
            end
        end
    end

    describe '#containing worry levels yourself' do
        context 'when given example from webpage' do

            it 'produces appropriate count (2713310158)' do
                expect(subject.part_2).to eq 2713310158
            end
        end
    end
end
