require 'rspec'
require '2021/Day16'

examples = {"8A004A801A8002F478" => [16, nil],
        "620080001611562C8802118E34" => [12, nil],
        "C0015000016115A2E0802F182340" => [23, nil],
        "A0016C880162017C3686B18A3D4780" => [31, nil],
        "C200B40A82" => [nil, 3],
        "04005AC33890" => [nil, 54],
        "880086C3E88112" => [nil, 7],
        "CE00C43D881120" => [nil, 9],
        "D8005AC2A8F0" => [nil, 1],
        "9C005AC2F8F0" => [nil, 0],
        "9C0141080250320F1802104A08" => [nil, 1]
}

RSpec.describe Y2021::Day16 do
    def self.test_double_it(input, pt1, pt2)
        subject = Y2021::Day16.new(input)
        if pt1 then
            describe '#calculates number of valid paths' do
                it "produces appropriate count (#{pt1})" do
                    expect(subject.part_1).to eq(pt1)
                end
            end
        end
        if pt2 then
            describe '#calculates number of valid paths' do
                it "produces appropriate count (#{pt2})" do
                    expect(subject.part_2).to eq(pt2)
                end
            end
        end
    end

    examples.each {
        |example_data, arr|
        pt_1, pt_2 = arr
        self.test_double_it(example_data, pt_1, pt_2)
    }
end
