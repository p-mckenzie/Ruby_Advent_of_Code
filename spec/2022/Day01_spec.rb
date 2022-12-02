require 'rspec'
require '2022/Day01'

RSpec.describe Y2022::Day01 do
    let(:example_data) { 
"1000
2000
3000

4000

5000
6000

7000
8000
9000

10000" 
    }
    let(:subject) { Y2022::Day01.new(example_data) }
    
    describe '#finds elf with most calories' do
        context 'when given example from webpage' do

            it 'produces appropriate count (24000)' do
                expect(subject.part_1).to eq 24000
            end
        end
    end

    describe '#sums top 3 elves by calories' do
        context 'when given example from webpage' do

            it 'produces appropriate count (45000)' do
                expect(subject.part_2).to eq 45000
            end
        end
    end
end
