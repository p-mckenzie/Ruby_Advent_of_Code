require 'rspec'
require '2020/Day02'

RSpec.describe Day02 do
    let(:example_data) {
        "1-3 a: abcde
        1-3 b: cdefg
        2-9 c: ccccccccc"
    }
    let(:subject) { Day02.new(example_data) }
    
    describe '#Part 1: counts number of valid passwords' do
        context 'when given example from webpage' do
            
            it 'produces appropriate count (2)' do
                expect(subject.num_valid_1).to eq 2
            end
        end
    end

    describe '#Part 2: counts number of strictly valid passwords' do
        context 'when given example from webpage' do
            
            it 'produces appropriate count (1)' do
                expect(subject.num_valid_2).to eq 1
            end
        end
    end
end
