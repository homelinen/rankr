class MatchesController < ApplicationController
  # GET /matches
  # GET /matches.json
  def index
    @tournament = params[:tournament_id]

    @matches = Match.where(:tournament_id => @tournament)
    @matches = Match.order('game').all unless @tournament

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matches }
    end
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    @match = Match.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/new
  # GET /matches/new.json
  def new
    @match = Match.new

    if params[:tournament_id]
      @match.tournament_id = params[:tournament_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/1/edit
  def edit
    @match = Match.find(params[:id])
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(params[:match])

    if params[:duration]
      @match.duration = params[:duration][:hours].to_i * 60 + params[:duration][:minutes].to_i
    end

    @match.start = params[:match][:start].to_datetime + (time_to_int(params[:time])).minutes

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render json: @match, status: :created, location: @match }
      else
        format.html { render action: "new" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # Convert {:hour => hour, :minutes => minutes} to an integer
  def time_to_int(duration)
    duration[:hours].to_i * 60 + duration[:minutes].to_i
  end

  # PUT /matches/1
  # PUT /matches/1.json
  def update
    @match = Match.find(params[:id])

    if params[:duration]
      @match.duration = params[:duration][:hours].to_i * 60 + params[:duration][:minutes].to_i
    end

    @match.start = params[:match][:start].to_datetime + (time_to_int(params[:time])).minutes

    respond_to do |format|
      if @match.update_attributes(params[:match])
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    respond_to do |format|
      format.html { redirect_to matches_url }
      format.json { head :no_content }
    end
  end
end
