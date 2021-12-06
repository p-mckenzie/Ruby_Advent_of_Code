require 'rspec'
require '2020/Day01'

RSpec.describe Y2020::Day01 do
    let(:example_data) {
        "1721
        979
        366
        299
        675
        1456"
    }
    let(:subject) { Y2020::Day01.new(example_data) }
    
    describe '#finds pairs in expense report' do
        context 'when given example from webpage' do
            
            it 'produces appropriate product (514579)' do
                expect(subject.part_1).to eq 514579
            end
        end
    end

    describe '#finds triplets in expense report' do
        context 'when given example from webpage' do
            
            it 'produces appropriate product (241861950)' do
                expect(subject.part_2).to eq 241861950
            end
        end
    end
end
