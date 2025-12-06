require 'rspec'
require '2025/Day06'

RSpec.describe Y2025::Day06 do
    let(:example) { 
"123 328  51 64 
 45 64  387 23 
  6 98  215 314
*   +   *   + " 
    }
    let(:subject) { Y2025::Day06.new(example) }
    
    describe '#does cephalopod math' do
        context 'when given example from webpage' do

            it 'produces total (4277556)' do
                expect(subject.part_1).to eq 4277556
            end

            it 'does column math (3263827)' do
                expect(subject.part_2).to eq 3263827
            end
        end
    end
end
