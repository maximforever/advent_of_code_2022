# Advent of Code 2022

These are my solutions to Advent of Code 2022, done in `Ruby`.

## Notes [**Spoilers!**]

Each day, I'll leave short notes about that day's challenge. I might blog about some days more thoroughly, in which case I'll link to the post

Last year, I lasted 8 days; the year before, 5-6. The challenge came from the problem difficulty, not from issues learning Ruby. This year, the goal is to complete all the challenges.

### Day 1
Paired with Terry on this one! It feels like it's been a while since I've looked at Ruby code.
Straightforward; keeping it simple and not worrying about creating elf objects was key here for me.
Terry's `calories_per_elf.sort.last(3).sum` was very elegant.

### Day 2

**Part 1:**
Surprisingly hard! ABC/XYZ to rock/paper/scissors was a frustrating conversion.
I came up with a clever array index trick, but then implemented it wrong like 4-5 times.
> if `their_moves(our_move_index - 2) == their_move` then we lose

**Part 2:**
Part two was much more straightforward, but overall, this day was kind of a pain. I'm not happy with my code - the names aren't great, and the logic isn't easy to follow.

Going to try and follow Terry's advice and look at other Ruby solutions.

### Day 3
I made the connection between part 1 & 2 relatively quickly. Part 1 is splitting the string in 2 and searching for the common element between these two groups, part 2 is searching for the common element between 3 larger groups.
The story actually confused me more than it helped this time. Authenticity stickers, ha!

I tried to generalize for any group of size `n`, but my ruby knowledge limited me. So I just solved for the two cases we got. Ruby made two things easy: intersection with `a & b` and `a.intersects(b, c, d...)`, as well as getting the character code with `char.ord`

Overall, I felt sloppy on this one.

### Day 4
Apparently Ruby has [array decomposition](https://ruby-doc.org/core-3.0.0/doc/syntax/assignment_rdoc.html#label-Array+Decomposition), which feels a lot like array destructuring in JavaScript.

**Part 1:**
I felt calmer today. I tackled the problem earlier in the morning, and tried my best to focus on it without interruption. I figured if Part 1 is "note one section containing another", Part 2 will be something like "not any overlap", "count overlapped sections", or "return only sections without overlap". But I decided not to optimize prematurely and went with a straightforward solution of comparing the upper/lower bounds between two sections to register. A friend is working on collision detection for a game right now, and this feels a little like that.

**Part 2:**
I was right! Part 2 is "any overlap at all". Again, I took a clean, if not the most efficient, approach.

I'm happier with my code today. It's not clever, but it is readable. And it uses a few Rubyish things, like array decomposition, `.map(&:to_i)`

### Day 5
Well, today I spent like an hour debugging why `Array.new(3, [])` created an array of three elements where each element references the same array. Pushing to the first array... pushed to all of them. This sidelined me for way too long. The correct answer is `Array.new(3) {Array.new}` 😒

In general, I spent a solid hour and a half trying to effectively parse the damn crates. Then I spent a much more reasonable 15-20 minutes implementing the solution. Parsing was by far the hard part.

**Part 1:**
After parsing the data, actually moving the crates was relatively straightforward - just operating on an array of arrays. I think parsing the data helped me develop a strong intuition for the problem.

**Part 2:**
Not much to say here; `Array.pop(n)` is nice.

### Day 6
Today was straightforward!

**Part 1:**
I brute-forced Part 1 by manually comparing characters.

**Part 2:**
I decided to rewrite part 1 to accept any arbitrary length. I used Ruby's `.uniq` to compare a substring to its unique version to see if every character is unique. That felt a little like cheating, but is definitely taking advantage of Ruby.

### Day 7
[coming soon!]