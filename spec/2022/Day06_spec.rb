require 'rspec'
require '2022/Day06'

examples = {"mjqjpqmgbljsphdztnvjfqwrcgsmlb" => [7, 19],
        "bvwbjplbgvbhsrlpgdmjqwftvncz" => [5, 23],
        "nppdvjthqldpwncqszvftbrmjlhg" => [6, 23],
        "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg" => [10, 29],
        "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw" => [11, 26],
}

RSpec.describe Y2022::Day06 do
    def self.test_packet_decode(input, pt1, pt2)
        subject = Y2022::Day06.new(input)
        if pt1 then
            describe '#calculates sum of version numbers' do
                it "produces appropriate sum (#{pt1})" do
                    expect(subject.part_1).to eq(pt1)
                end
            end
        end
        if pt2 then
            describe '#calculates final expression result' do
                it "produces appropriate number (#{pt2})" do
                    expect(subject.part_2).to eq(pt2)
                end
            end
        end
    end

    examples.each {
        |example_data, arr|
        pt_1, pt_2 = arr
        self.test_packet_decode(example_data, pt_1, pt_2)
    }
end

