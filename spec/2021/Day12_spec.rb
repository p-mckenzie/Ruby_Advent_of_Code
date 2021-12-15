require 'rspec'
require '2021/Day12'

examples = {"start-A
start-b
A-c
A-b
b-d
A-end
b-end" => [10, 36],
"dc-end
HN-start
start-kj
dc-start
dc-HN
LN-dc
HN-end
kj-sa
kj-HN
kj-dc" => [19, 103],
"fs-end
he-DX
fs-he
start-DX
pj-DX
end-zg
zg-sl
zg-pj
pj-he
RW-he
fs-DX
pj-RW
zg-RW
start-pj
he-WI
zg-he
pj-fs
start-RW" => [226, 3509]
}

RSpec.describe Y2021::Day12 do
    def self.test_double_it(input, pt1, pt2)
        subject = Y2021::Day12.new(input)
        describe '#calculates number of valid paths' do
            it "produces appropriate count (#{pt1})" do
                expect(subject.part_1).to eq(pt1)
            end
        end
        describe '#calculates number of valid paths' do
            it "produces appropriate count (#{pt1})" do
                expect(subject.part_1).to eq(pt1)
            end
        end
    end

    examples.each {
        |example_data, arr|
        pt_1, pt_2 = arr
        self.test_double_it(example_data, pt_1, pt_2)
    }
end
