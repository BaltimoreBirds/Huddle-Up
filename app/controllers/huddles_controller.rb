class HuddlesController < ApplicationController
  helper_method :huddles

  respond_to :html, :json

  def index
      @huddles = Huddle.all
  end

  def new
    @huddle = Huddle.new
  end

  def show
    @huddle = Huddle.find(params[:id])

    respond_with @huddle
  end

  def create
    if current_user != nil
      @huddle = Huddle.new(huddle_params)
      @huddle.creator = current_user.id

      if @huddle.save
        HuddleUser.create(user_id: current_user.id, huddle_id: @huddle.id)
        redirect_to huddles_path, notice: "Huddle Created"
      else
        render action: 'new'
      end
    else
      redirect_to root_path, notice: 'You must be signed in to do that.'
    end
  end

  def update
    if current_user != nil
      @huddle = Huddle.find(params[:id])

      respond_to do |format|
        if HuddleUser.where(user_id: current_user.id, huddle_id: @huddle.id) == []
          HuddleUser.create(user_id: current_user.id, huddle_id: @huddle.id)
          format.html{redirect_to @huddle, notice: 'You\'ve joined this Huddle!'}
          format.js
          format.json {render json: @huddle}
        else
          format.html{redirect_to :back, notice: "You\'re already in this Huddle."}
          format.json { render json: @huddle.errors, status: :unprocessable_entity }
        end
      end


    else
      redirect_to root_path, notice: 'You must be signed in to do that.'
    end
  end

private
  def huddle_params
    params.require(:huddle).permit( :skill_level, :size_of_huddle, :time_and_date)
  end

end
