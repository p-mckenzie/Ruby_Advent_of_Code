require 'rspec'
require '2024/Day01'

RSpec.describe Y2024::Day01 do
    let(:example) { 
"3   4
4   3
2   5
1   3
3   9
3   3" 
    }
    let(:subject) { Y2024::Day01.new(example) }
    
    describe '#sorts and diffs' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (11)' do
                expect(subject.part_1).to eq 11
            end

            it 'produces appropriate similarity score (31)' do
                expect(subject.part_2).to eq 31
            end
        end
    end
end
