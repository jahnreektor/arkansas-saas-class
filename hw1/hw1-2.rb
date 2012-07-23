# If this code is too messy, feel free to fix it! - JDR

class WrongNumberOfPlayersError < StandardError; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length==2
  game.each do |item|
    raise NoSuchStrategyError if !['R','P','S'].include?(item.last.capitalize)
  end
  firstStrat = game[0].last.capitalize
  secondStrat = game[1].last.capitalize
  if ((firstStrat == 'P' && secondStrat=='R') || (firstStrat =='S' && secondStrat=='P') || (firstStrat=='R' && secondStrat=='S') || firstStrat==secondStrat)
    game[0]
  else
    game[1]
  end
end

# EXPLANATION
# First, I check that the game is valid and raise an error if it's not
# Next, I grab the last item in each array (and capitalize it)
# Finally, I do a simple if-else set of conditions to determine the winner,
# returning the array of the winner


def rps_tournament_winner(tourney)
  if (tourney[0].first.kind_of?String)
    tourney = rps_game_winner(tourney)
  else 
    tourney[0]=rps_tournament_winner(tourney[0])
    tourney[1]=rps_tournament_winner(tourney[1])
    rps_game_winner(tourney)
  end
end

# EXPLANATION
# This is a recursive method.  The base case is that there will be two final arrays where
# the contents are strings.  if (tourney[0].first.kind_of?String) tests this, and if true
# calls my existing method to determine the winner.

# The else statement indicates that there are nested arrays where need to recursively
# find the winner. Lines 31-33 recursively call this method on each sub array, finding the winner.

# TEST CODE 
# myGame = [["Armando", "R"], ["Dave", "R"]]
# myGame2= [[[["Armando", "P"], ["Dave", "S"]],[["Richard", "R"],["Michael", "S"]],],[[["Allen", "S"], ["Omer", "P"]], [["David E.", "R"], ["Richard X.", "P"]]]]
# #print rps_game_winner(myGame)
# print rps_tournament_winner(myGame2)
# # print "STRING!" if ("string".kind_of?(String))