
class StaticsticsController < ApplicationController
    def table_positions
      @scores = Report::TableScore.scores
    end
  end




