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

  # GET /details_matches/new
  def new
    @details_match = DetailsMatch.new
  end

  # GET /details_matches/1/edit
  def edit
  end

  # POST /details_matches
  # POST /details_matches.json
  def create
    @details_match = DetailsMatch.new(details_match_params)

    respond_to do |format|
      if @details_match.save
        format.html { redirect_to @details_match, notice: 'Details match was successfully created.' }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def details_match_params
      params.require(:details_match).permit(:match_id, :team_id, :player_id, :event_id, :minute)
    end
end
