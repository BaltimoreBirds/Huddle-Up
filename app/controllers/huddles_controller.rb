class HuddlesController < ApplicationController
  helper_method :huddles

  def index
    @huddles = Huddle.all
  end

  def new
    @huddle = Huddle.new
  end

  def create
    @huddle = Huddle.new(huddle_params)
    @huddle.user_id = current_user.id

    if @huddle.save
      redirect_to huddles_path, notice: "Huddle Created"
    else
      render action: 'new'
    end
  end

private
  def huddle_params
    params.require(:huddle).permit( :skill_level, :size_of_huddle, :court)
  end

end
