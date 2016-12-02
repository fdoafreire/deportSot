
class StaticsticsController < ApplicationController
    def table_positions
      @scores =  Report::TableScore.score
    end
  end




