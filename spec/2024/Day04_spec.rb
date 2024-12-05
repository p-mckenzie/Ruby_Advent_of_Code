require 'rspec'
require '2024/Day04'

RSpec.describe Y2024::Day04 do
    let(:example) { 
"MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX" 
    }
    let(:subject) { Y2024::Day04.new(example) }
    
    describe '#finds XMAS' do
        context 'when given example from webpage' do

            it 'produces appropriate line count (18)' do
                expect(subject.part_1).to eq 18
            end

            it 'produces appropriate X count (9)' do
                expect(subject.part_2).to eq 9
            end
        end
    end
end
