require 'pry'

class SectionCleaner
  def initialize(file_name)
    lines = File.read(file_name).split("\n")

    @section_pairs =  lines.map do |line|
      # I'm sure there's a Ruby-er way to do this.
      first_pair, second_pair = line.split(",")
      first_lower, first_upper = first_pair.split("-").map(&:to_i)
      second_lower, second_upper = second_pair.split("-").map(&:to_i)

      [[first_lower, first_upper], [second_lower, second_upper]]
    end
  end

  def count_overlaps
    overlaps = 0
    @section_pairs.each do |pair|
      overlaps += 1 if(numbers_contain_one_another?(pair[0][0], pair[0][1], pair[1][0], pair[1][1]))
    end

    overlaps
  end

  def numbers_contain_one_another?(n1, n2, n3, n4)
    first_pair_contains_second = (n1 <= n3 && n2 >= n4)
    second_pair_contains_first = (n1 >= n3 && n2 <= n4)
    return first_pair_contains_second || second_pair_contains_first
  end
end

counter = SectionCleaner.new('input.txt')
p counter.count_overlaps