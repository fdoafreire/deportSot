
class StaticsticsController < ApplicationController
    def table_positions
      @scores =  Report::TableScore.score
    end
    def table_players_goals
      @events =  Report::PlayersGoals.events
    end
  end




