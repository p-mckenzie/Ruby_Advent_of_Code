require 'rspec'
require '2023/Day03'

RSpec.describe Y2023::Day03 do
    let(:example) { 
"467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598.." 
    }
    let(:subject) { Y2023::Day03.new(example) }
    
    describe '#finds numbers adjacent to symbols' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (4361)' do
                expect(subject.part_1).to eq 4361
            end
        end
    end

    describe '#finds gear ratios' do
        context 'when given example from webpage' do

            it 'produces appropriate product (467835)' do
                expect(subject.part_2).to eq 467835
            end
        end
    end
end
