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

  def count_overlaps(partial=false)
    overlaps = 0
    @section_pairs.each do |pair|

      if(partial)
        overlaps += 1 if(any_overlap?(pair[0][0], pair[0][1], pair[1][0], pair[1][1]))
      else
        overlaps += 1 if(total_overlap?(pair[0][0], pair[0][1], pair[1][0], pair[1][1]))
      end
    end

    overlaps
  end

  def total_overlap?(n1, n2, n3, n4)
    first_pair_contains_second = (n1 <= n3 && n2 >= n4)
    second_pair_contains_first = (n1 >= n3 && n2 <= n4)
    return first_pair_contains_second || second_pair_contains_first
  end

  def any_overlap?(n1, n2, n3, n4)
    first_pair_lower_overlap = (n1 >= n3 && n1 <= n4)
    first_pair_upper_overlap = (n2 >= n3 && n2 <= n4)
    second_pair_lower_overlap = (n3 >= n1 && n3 <= n2)
    second_pair_upper_overlap = (n4 >= n1 && n4 <= n2)

    return first_pair_lower_overlap || first_pair_upper_overlap || second_pair_lower_overlap || second_pair_upper_overlap
  end
end

counter = SectionCleaner.new('input.txt')
p counter.count_overlaps
p counter.count_overlaps(true)