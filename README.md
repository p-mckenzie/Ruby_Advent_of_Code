# Advent of Code 2021
25 scripts to complete the 25 challenges for the [2021](https://adventofcode.com/2021) and [2022](https://adventofcode.com/2022) Advent of Code challenges. All code written by [Paige McKenzie](https://github.com/p-mckenzie).

This project was undertaken live, during December 2021, and December 2022.

## Usage

Generally, each file `lib/YEAR/Dayx.rb` will leverage a file `public/YEAR/dayx.txt`, provided by the challenge website (and not included in this repository), and output the challenge results (typically a number for part one, and another number for part two, each day). These individual files can be executed by running `ruby lib/YEAR/Dayx.rb` in the terminal.

Each day also has a rspec file `spec/YEAR/Dayx_spec.rb`, which will contain some test cases (typically provided by the challenge website) to ensure the code is functioning correctly. These can be executed individually by running `rspec spec/YEAR/Dayx_spec.rb` in the terminal, or all specs can be run at once by simply running `rspec` in the terminal.