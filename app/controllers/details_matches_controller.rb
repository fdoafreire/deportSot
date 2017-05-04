class DetailsMatchesController < ApplicationController
  before_action :set_details_match, only: [:show, :edit, :update, :destroy]

  # GET /details_matches
  # GET /details_matches.json
  def index
    @details_matches = DetailsMatch.all
  end

  # GET /details_matches/1
  # GET /details_matches/1.json
  def show
  end
  def details_matches_path
  end
  # GET /details_matches/new

  def details_form
     @events       = Event.all
  end

  def details_create
    @detail = Details_match.new(match_params)

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
 
  def new_detail
    @events        = Event.all
    @match         = Match.find(params[:match_id])
    @details_matches = DetailsMatch.where(match_id: params[:match_id]).order('id desc')
  end
  # GET /details_matches/1/edit
  def edit
  end
  # POST /details_matches
  # POST /details_matches.json
  def create_detail
    @details_match = DetailsMatch.new
    @details_match.match_id  = params[:match_id]
    @details_match.team_id   = params[:team_id]
    @details_match.player_id = params[:player_id]
    @details_match.event_id  = params[:event_id]
    @details_match.minute    = params[:minute]
    @match = Match.find(@details_match.match_id)
    if @match.status == 0 
       @match.status = 1
       @match.save
    end
    respond_to do |format|
      if @details_match.save
         case @details_match.event_id 
           when 1
            @player=Player.find(@details_match.player_id)
            if (find_yellow_cards)
                @details_match = DetailsMatch.new
                @details_match.match_id  = params[:match_id]
                @details_match.team_id   = params[:team_id]
                @details_match.player_id = params[:player_id]
                @details_match.event_id  = 2
                @details_match.minute    = params[:minute]
                @details_match.save
                
                @player.status                  = 1
                @player.yellow_cards            = 0
                @player.penalized_matches       = 1
                @player.matches_without_playing = 0
            else
                @player.yellow_cards = @player.yellow_cards + 1
            end
            @player.save
           when 2
                @player.status = 2
                @player.yellow_cards = 0
                @player.red_cards = 1
                @player.penalized_matches = 2
                @player.matches_without_playing = 0
                @player.save
           when 3
              if (@match.local_id == @details_match.team_id)
                goals=@match.goals_local_team
                goals= 0 if goals.nil?
                @match.goals_local_team = goals + 1;
              else
                if (@match.visitant_id == @details_match.team_id)
                   goals=@match.goals_visitant_team
                   goals= 0 if goals.nil?
                   @match.goals_visitant_team = goals + 1;
                end
              end
              @match.save
          end
        format.html { redirect_to '/details_match/' << @details_match.match_id.to_s << '/new', notice: 'Details match was successfully created.' }
        format.json { render :show, status: :created, location: @details_match }
      else
        format.html { render :new }
        format.json { render json: @details_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /details_matches/1
  # PATCH/PUT /details_matches/1.json
  def update
    respond_to do |format|
      if @details_match.update(details_match_params)
        format.html { redirect_to @details_match, notice: 'Details match was successfully updated.' }
        format.json { render :show, status: :ok, location: @details_match }
      else
        format.html { render :edit }
        format.json { render json: @details_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /details_matches/1
  # DELETE /details_matches/1.json
  def destroy
    @details_match.destroy
    respond_to do |format|
      format.html { redirect_to details_matches_url, notice: 'Details match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_details_match
      @details_match = DetailsMatch.find(params[:id])
    end

    def find_yellow_cards ()
        @player = params[:player_id]
        @events_match = DetailsMatch.where(match_id: params[:match_id], player_id:params[:player_id], event_id: 1)
        if @events_match.blank?
          return false
        else
          return true
        end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def details_match_params
      params.require(:details_match).permit(:match_id, :team_id, :player_id, :event_id, :minute,:player_name)
    end
end
