require 'pry'

class Gamer
  def initialize(file_name)
    @rounds = File.read(file_name).split("\n").map {|line| line.split(" ")}
  end

  # A - rock - X
  # B - paper - Y
  # C - scissors - Z

  def get_total_score
    total_score = 0
    @rounds.each do |round|
      this_score = score_for_round(round)
      total_score += this_score
    end

    puts total_score
    total_score
  end

  def score_for_round(round)
    their_move = round[0]
    our_move = round[1]
    move_score(our_move) + result_score(resolve_round(their_move, our_move))
  end

  def resolve_round(their_move, our_move)
    their_moves = ["A", "B", "C"]
    our_moves   = ["X", "Y", "Z"]
    raise "those aren't valid moves" unless our_moves.include?(our_move) && their_moves.include?(their_move)


    if(our_moves.find_index(our_move) == their_moves.find_index(their_move))
      return "draw"
    else
      # we take our move, we move 2 indexes back. If that's their move, we're toast.
      their_moves[(our_moves.find_index(our_move) - 2)] == their_move ? "lose" : "win"
    end
  end

  def move_score(move)
    moves = {
      X: 1,
      Y: 2,
      Z: 3
    }

    moves[move.to_sym]
  end

  def result_score(outcome)
    outcomes = {
      lose: 0,
      draw: 3,
      win:  6,
    }

    outcomes[outcome.to_sym]
  end
end

counter = Gamer.new('input.txt')
counter.get_total_score