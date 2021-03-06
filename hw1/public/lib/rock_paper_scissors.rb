class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    
    if player1[1] == 'R' and player2[1] == 'S' then return player1 end
    if player1[1] == 'P' and player2[1] == 'R' then return player1 end  
    if player1[1] == 'S' and player2[1] == 'P' then return player1 end
    
    if player2[1] == 'P' and player1[1] == 'R' then return player2 end
    if player2[1] == 'R' and player1[1] == 'S' then return player2 end
    if player2[1] == 'S' and player1[1] == 'P' then return player2 end
      
    if player1[1] == player2[1] then return player1 end 
    
    #Not going to lie, I had to look up how to do this via the googler
    else raise NoSuchStrategyError, "Strategy must be one of R,P,S"  
  end

  def self.tournament_winner(tournament)
    if(tournament[0].is_a? String and tournament[1].is_a? String)
     champ = winner(tournament)
    else
      tournament_winner(
        tournament_winner(tournament[0]),tournament_winner(tournament[1])
      )
    end
    return champ
  end

end
