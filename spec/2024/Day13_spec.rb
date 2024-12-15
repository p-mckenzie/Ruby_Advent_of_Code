require 'rspec'
require '2024/Day13'

RSpec.describe Y2024::Day13 do
    let(:example) { 
"Button A: X+94, Y+34
Button B: X+22, Y+67
Prize: X=8400, Y=5400

Button A: X+26, Y+66
Button B: X+67, Y+21
Prize: X=12748, Y=12176

Button A: X+17, Y+86
Button B: X+84, Y+37
Prize: X=7870, Y=6450

Button A: X+69, Y+23
Button B: X+27, Y+71
Prize: X=18641, Y=10279" 
    }
    let(:subject) { Y2024::Day13.new(example) }
    
    describe '#drives the claw machine' do
        context 'when given example from webpage' do

            it 'calculates minumum tokens (480)' do
                expect(subject.part_1).to eq 480
            end

            it 'pads by a lot of zeros (875318608908)' do
                expect(subject.part_2).to eq 875318608908
            end
        end
    end

    let(:example_mine) { 
"Button A: X+46, Y+89
Button B: X+99, Y+32
Prize: X=5826, Y=7443" 
    }

    let(:subject_1) { Y2024::Day13.new(example_mine) }
    
    describe '#drives the claw machine' do
        context 'when given example from my input' do

            it 'calculates minumum tokens (249)' do
                expect(subject_1.part_1).to eq 249
            end
        end
    end

end
