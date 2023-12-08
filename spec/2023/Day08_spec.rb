require 'rspec'
require '2023/Day08'

RSpec.describe Y2023::Day08 do
    let(:example_1) { 
"LLR

AAA = (BBB, BBB)
BBB = (AAA, ZZZ)
ZZZ = (ZZZ, ZZZ)" 
    }
    let(:subject_1) { Y2023::Day08.new(example_1) }
    
    describe '#calculates steps to reach end' do
        context 'when given example from webpage' do

            it 'produces appropriate number (6)' do
                expect(subject_1.part_1).to eq 6
            end
        end
    end

    let(:example_2) {
        "LR

11A = (11B, XXX)
11B = (XXX, 11Z)
11Z = (11B, XXX)
22A = (22B, XXX)
22B = (22C, 22C)
22C = (22Z, 22Z)
22Z = (22B, 22B)
XXX = (XXX, XXX)"
    }
    let(:subject_2) { Y2023::Day08.new(example_2) }

    describe '#calculates all steps to reach end' do
        context 'when given example from webpage' do

            it 'produces appropriate num (6)' do
                expect(subject_2.part_2).to eq 6
            end
        end
    end
end
