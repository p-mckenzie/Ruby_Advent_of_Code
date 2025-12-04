require 'rspec'
require '2025/Day03'

RSpec.describe Y2025::Day03 do
    let(:example) { 
"11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124" 
    }
    let(:subject) { Y2025::Day03.new(example) }
    
    describe '#counts valid ids into safe' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (1227775554)' do
                expect(subject.part_1).to eq 1227775554
            end

            it 'produces more complicated sum (4174379265)' do
                expect(subject.part_2).to eq 4174379265
            end
        end
    end
end
