require 'rspec'
require '2023/Day06'

RSpec.describe Y2023::Day06 do
    let(:example) { 
"Time:      7  15   30
Distance:  9  40  200" 
    }
    let(:subject) { Y2023::Day06.new(example) }

    describe '#get_range does quadratic correctly' do
        it 'when given first example' do
            expect(subject.get_range(7,9)).to eq 4
            expect(subject.get_range(15,40)).to eq 8
            expect(subject.get_range(30,200)).to eq 9
        end

    end
    
    describe '#calculates ways to win' do
        context 'when given example from webpage' do

            it 'produces appropriate product (288)' do
                expect(subject.part_1).to eq 288
            end
        end
    end

    describe '#calculates with big numbers' do
        context 'when given example from webpage' do

            it 'produces appropriate number (71503)' do
                expect(subject.part_2).to eq 71503
            end
        end
    end
end
