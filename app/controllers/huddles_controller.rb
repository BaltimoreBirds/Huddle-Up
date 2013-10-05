class HuddlesController < ApplicationController
  helper_method :huddles

  def index
    @huddles = Huddle.all
  end

  def new
    @huddle = Huddle.new
  end

  def show
    @huddle = Huddle.find(params[:id])
  end

  def create
    @huddle = Huddle.new(huddle_params)
    @huddle.creator = current_user.id
    @huddle.num_of_ballers_currently = 1

    if @huddle.save
      HuddleUser.create(user_id: current_user.id, huddle_id: @huddle.id)
      redirect_to huddles_path, notice: "Huddle Created"
    else
      render action: 'new'
    end
  end

  def update
    @huddle = Huddle.find(params[:id])
    @huddle.num_of_ballers_currently = (@huddle.num_of_ballers_currently + 1)
    @huddle_user = HuddleUser.find(params[:id])
    if @huddle.update(huddle_params)
      render action: 'show', notice: 'You\'ve joined this Huddle!'
    else
      redirect_to :back, notice: "Attempt to join failed."
    end
  end

private
  def huddle_params
    params.require(:huddle).permit( :skill_level, :size_of_huddle, :court)
  end

end
