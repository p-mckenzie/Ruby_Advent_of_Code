require 'rspec'
require '2023/Day15'

RSpec.describe Y2023::Day15 do
    let(:example) { 
"HASH" 
    }
    let(:subject) { Y2023::Day15.new(example) }
    
    describe '#calculates HASH algorithm' do
        context 'when given example from webpage' do

            it 'produces appropriate num (52)' do
                expect(subject.part_1).to eq 52
            end
        end
    end

    let(:example_2) { 
"rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7" 
    }
    let(:subject_2) { Y2023::Day15.new(example_2) }
    
    describe '#calculates HASH algorithm' do
        context 'when given example from webpage' do

            it 'produces appropriate num (1320)' do
                expect(subject_2.part_1).to eq 1320
            end
        end
    end
    describe '#calculates focusing power' do
        context 'when given example from webpage' do
            it 'produces appropriate num (145)' do
                expect(subject_2.part_2).to eq 145
            end
        end
    end
end
