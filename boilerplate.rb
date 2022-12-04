require 'pry'

class ClassName
  def initialize(file_name)
    @rounds = File.read(file_name).split("\n").map {|line| line.split(" ")}
  end

  def method
    total_score = 0
  end
end

counter = ClassName.new('test_input.txt')
counter.method