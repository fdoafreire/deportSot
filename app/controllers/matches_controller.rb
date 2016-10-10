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
  # GET /generate/1/matches
  def generate
     @championship =Championship.find(params[:id])
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
                cont = cont + 1
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
                    cont = cont - 1
                    if cont < 0
                      cont = @teamsr.count - 2
                    end
                 end
            end
        end
        cont=1;
        @matchesr.each do | row |
           row.each do | col |
             matchr = col.split('-')
             local_id = matchr[0].to_i
             visit_id = matchr[1].to_i
             match= Match.create(local_id:local_id,visitant_id:visit_id,match_date:Time.now.strftime("%Y-%d-%m %H:%M:%S %Z"),date_number:cont,championship_id:1)
           end
           cont= cont + 1
        end
     else
        @count_matches_date = (@teams.count - 1) / 2
        @count_date = @teams.count 
        cont=0
        @matchesr=Array.new(@count_date) { Array.new(@count_matches_date + 1) }
        for x in (0..@count_date - 1) 
            for y in (0..@count_matches_date)
                @matchesr[x][y]=@teamsr[cont]
                cont = cont + 1
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
                    cont = cont - 1
                    if cont < 0
                      cont = @teamsr.count - 1
                    end
                 end
            end
        end
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
      params.require(:match).permit(:local_id, :visitant_id, :match_date, :date_number, :championship_id)
    end
end
