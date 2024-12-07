require 'rspec'
require '2024/Day07'

RSpec.describe Y2024::Day07 do
    let(:example) { 
"190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20" 
    }
    let(:subject) { Y2024::Day07.new(example) }
    
    describe '#evaluates operators' do
        context 'when given example from webpage' do

            it 'produces correct total calibration result (3749)' do
                expect(subject.part_1).to eq 3749
            end

            it 'calibrates with 3rd operator (11387)' do
                expect(subject.part_2).to eq 11387
            end
        end
    end
end
