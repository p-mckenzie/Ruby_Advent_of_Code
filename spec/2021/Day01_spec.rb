require 'rspec'
require '2021/Day01'

RSpec.describe Day01 do
    let(:data) { }
    let(:subject) { Day01.new(data: data) }
    
    describe '#counts number of depth increases' do
        context 'when given example from webpage' do
            let(:data) { [199, 200, 208, 210, 200, 207, 240, 269, 260, 263] }

            it 'produces appropriate count (7)' do
                expect(subject.count_descending).to eq 7
            end
        end

        context 'when given individualized inputs' do
      
            it 'returns an integer result' do
              expect(subject.count_descending).to be_an(Integer)
            end
        end
    end

    describe '#counts number of depth increases by threesums' do
        context 'when given example from webpage' do
            let(:data) { [199, 200, 208, 210, 200, 207, 240, 269, 260, 263] }

            it 'produces appropriate count (7)' do
                expect(subject.count_descending(subject.triples_sum)).to eq 5
            end
        end

        context 'when given individualized inputs' do
      
            it 'returns an integer result' do
              expect(subject.count_descending(subject.triples_sum)).to be_an(Integer)
            end
        end
    end
end
