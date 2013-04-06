class AwardsController < ApplicationController
  load_and_authorize_resource :award
  
  # GET /awards
  # GET /awards.json
  def index

    match = params[:match_id]

    @awards = Award.where(:match_id => match)
    @awards = Award.all if (@awards.empty?)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @awards }
    end
  end

  # GET /awards/new
  # GET /awards/new.json
  def new

    @award = Award.new

    if params[:match_id]
      @award.match_id = params[:match_id]
    end

    if cannot? :manage, @award.match
      raise CanCan::AccessDenied.new("You don't have permission to do that", :create, Match)
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @award }
    end
  end

  # GET /awards/1/edit
  def edit
    @award = Award.find(params[:id])
  end

  # POST /awards
  # POST /awards.json
  def create

    @username = params[:user][:username]
    @award = Award.new(params[:award])
    
    @user = User.where(:username => @username).first

    if @user
      @award.user = @user
    else
      @award.username = @username
    end

    respond_to do |format|
      if @award.save
        format.html { redirect_to @award.match, notice: 'Award was successfully created.' }
        format.json { render json: @award, status: :created, location: @award }
      else
        format.html { render action: "new" }
        format.json { render json: @award.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /awards/1
  # PUT /awards/1.json
  def update

    @username = params[:user][:username]
    @award = Award.new(params[:award])
    
    @user = User.where(:username => @username).first

    if @user
      @award.user = @user
    else
      @award.username = @username
    end

    respond_to do |format|
      if @award.update_attributes(params[:award])
        format.html { redirect_to @award.match, notice: 'Award was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @award.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /awards/1
  # DELETE /awards/1.json
  def destroy
    @award = Award.find(params[:id])
    @award.destroy

    respond_to do |format|
      format.html { redirect_to awards_url }
      format.json { head :no_content }
    end
  end
end
