# Contains required components to fill the terminal. Variables in this module will be altered to play the game.
module Fillable
  @@row1 = '1 | 2 | 3'
  @@row2 = '4 | 5 | 6'
  @@row3 = '7 | 8 | 9'
  @@placeholder = '--+---+---'
  @@winning_conditions = [[@@row1[0], @@row1[4], @@row1[8]], [@@row1[0], @@row1[4], @@row1[8]].reverse,
                          [@@row2[0], @@row2[4], @@row2[8]], [@@row2[0], @@row2[4], @@row2[8]].reverse,
                          [@@row3[0], @@row3[4], @@row3[8]], [@@row3[0], @@row3[4], @@row3[8]].reverse,
                          [@@row1[0], @@row2[0], @@row3[0]], [@@row1[0], @@row2[0], @@row3[0]].reverse,
                          [@@row1[4], @@row2[4], @@row3[4]], [@@row1[4], @@row2[4], @@row3[4]].reverse,
                          [@@row1[8], @@row2[8], @@row3[8]], [@@row1[8], @@row2[8], @@row3[8]].reverse,
                          [@@row1[0], @@row2[4], @@row3[8]], [@@row1[0], @@row2[4], @@row3[8]].reverse,
                          [@@row1[8], @@row2[4], @@row3[0]], [@@row1[8], @@row2[4], @@row3[0]].reverse]

  def update_winning_conditions
    @@winning_conditions = [[@@row1[0], @@row1[4], @@row1[8]], [@@row1[0], @@row1[4], @@row1[8]].reverse,
                            [@@row2[0], @@row2[4], @@row2[8]], [@@row2[0], @@row2[4], @@row2[8]].reverse,
                            [@@row3[0], @@row3[4], @@row3[8]], [@@row3[0], @@row3[4], @@row3[8]].reverse,
                            [@@row1[0], @@row2[0], @@row3[0]], [@@row1[0], @@row2[0], @@row3[0]].reverse,
                            [@@row1[4], @@row2[4], @@row3[4]], [@@row1[4], @@row2[4], @@row3[4]].reverse,
                            [@@row1[8], @@row2[8], @@row3[8]], [@@row1[8], @@row2[8], @@row3[8]].reverse,
                            [@@row1[0], @@row2[4], @@row3[8]], [@@row1[0], @@row2[4], @@row3[8]].reverse,
                            [@@row1[8], @@row2[4], @@row3[0]], [@@row1[8], @@row2[4], @@row3[0]].reverse]
  end
end
