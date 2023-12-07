require 'rspec'
require '2023/Day07'

RSpec.describe Y2023::Day07 do
    
    describe '#type does poker' do
        it 'when given first example' do
            {'AAAAA' => 7, 
            'AA8AA' =>6,
            '23332' =>5,
            'TTT98' =>4,
            '23432' =>3,
            'A23A4' =>2,
            '23456' =>1,
                }.each {
                |text, result|
                hand = Y2023::Hand.new(text)
                expect(hand.type).to eq result
            }
        end
    end
    
    let(:example) { 
"32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483" 
    }
    let(:subject) { Y2023::Day07.new(example) }
    
    describe '#calculates total winnings' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (6440)' do
                expect(subject.part_1).to eq 6440
            end
        end
    end

    describe '#calculates with jokers' do
        context 'when given example from webpage' do

            it 'produces appropriate sum (5905)' do
                expect(subject.part_2).to eq 5905
            end
        end
    end
end
