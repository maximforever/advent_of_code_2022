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
[coming soon!]