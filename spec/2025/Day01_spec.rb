require 'rspec'
require '2025/Day01'

RSpec.describe Y2025::Day01 do
    let(:example) { 
"L68
L30
R48
L5
R60
L55
L1
L99
R14
L82" 
    }
    let(:subject) { Y2025::Day01.new(example) }
    
    describe '#crack into safe' do
        context 'when given example from webpage' do

            it 'produces appropriate count (3)' do
                expect(subject.part_1).to eq 3
            end

            it 'counts clicks past 0 (6)' do
                expect(subject.part_2).to eq 6
            end
        end
    end
end
