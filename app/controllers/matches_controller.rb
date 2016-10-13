class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  def generate_form
     @championships=Team.all
  end

  # GET /generate/1/matches
  def generate
     @championship =Championship.find(params[:championship_id])
     @teams = Team.where(championship_id: @championship.id)
     @count_matches=(@teams.count * (@teams.count - 1))/ 2
     cont = 0
     @teamsr= []
     @teams.each do | team | 
         @teamsr[cont]=team.id
         cont=cont + 1;
     end 
     if @teams.count.even?
        @count_matches_date = @teams.count / 2
        @count_date = @teams.count - 1
        cont=0
        @matchesr=Array.new(@count_date) { Array.new(@count_matches_date) }
        for x in (0..@count_date - 1) 
            for y in (0..@count_matches_date - 1)
                @matchesr[x][y]=@teamsr[cont]
                cont += 1
                if cont == @teamsr.count - 1
                  cont = 0
                end
            end
        end
        cont = @teamsr.count - 2
        for x in (0..@count_date - 1) 
            for y in (0..@count_matches_date - 1)
                 if y==0
                    @matchesr[x][y]=@matchesr[x][y].to_s << "-" << @teamsr.last.to_s
                 else
                    @matchesr[x][y]=@matchesr[x][y].to_s << "-" << @teamsr[cont].to_s
                    cont += 1
                    if cont < 0
                      cont = @teamsr.count - 2
                    end
                 end
            end
        end
        write_matches(@matchesr)
     else
        @count_matches_date = (@teams.count - 1) / 2
        @count_date = @teams.count 
        cont=0
        @matchesr=Array.new(@count_date) { Array.new(@count_matches_date + 1) }
        for x in (0..@count_date - 1) 
            for y in (0..@count_matches_date)
                @matchesr[x][y]=@teamsr[cont]
                cont += 1
                if cont == @teamsr.count 
                  cont = 0
                end
            end
        end
        cont = @teamsr.count - 1 
        for x in (0..@count_date - 1) 
            for y in (0..@count_matches_date)
                 if y==0
                    @matchesr[x][y]=@matchesr[x][y].to_s << "-" << "libre"
                 else
                    @matchesr[x][y]=@matchesr[x][y].to_s << "-" << @teamsr[cont].to_s
                    cont += 1
                    if cont < 0
                      cont = @teamsr.count - 1
                    end
                 end
            end
        end
        write_matches(@matchesr,false)
     end
  end


  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def generate_matches 
      
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:local_id, :visitant_id, :match_date, :date_number, :championship_id, :date_start)
    end
    # function that calculates the next play date
    # Params:
    # - date_matche: Time -  it contains last date of game
    # - days_game: array of string - it contains number days of week of game
    def get_dates_matche  (date_matche,days_game)
      flag_continue=true
      while flag_continue do
        date_matche = date_matche + 1.days
        day_week=date_matche.wday
        if days_game.include?(day_week.to_s)
           return date_matche
        end 
      end
    end
    # function that writes the database programming games
    # Params:
    # - matches: array of string  - it  contains crossings teams
    # - flag_even: Boolean - flag used to see if it is of type pair
    # - simultaneous_games: Integer - is contains quantity of simultaneous games
    # - days_game: array of string - it contains number days of week of game (parameter necessary to calculate date matche)
    def write_matches (matches,flag_even=true,simultaneous_games=1,days_game)
        counter_date_number=1;
        counter_simultaneous_games=1
        date_game_matche = params[:date_start]
        @matchesr.each do | row |
           row.each_with_index do | col, key |
             if key == 0  &  !flag_continue
                next
             end
             matchr = col.split('-')
             local_id = matchr[0].to_i
             visit_id = matchr[1].to_i
             match= Match.create(local_id:local_id,visitant_id:visit_id,match_date:date_game_matche.strftime("%Y-%d-%m %H:%M:%S %Z"),date_number:counter_date_number,championship_id:1)
             counter_simultaneous_games += 1
             if counter_simultaneous_games > simultaneous_games
                counter_simultaneous_games = 1
                get_dates_matche(date_game_matche,days_game)
             end
           end
           counter_date_number += 1
        end
    end

end
