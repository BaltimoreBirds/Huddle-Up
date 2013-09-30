class HuddlesController < ApplicationController
  helper_method :huddles

  def index

  end

  def new
    @huddle = Huddle.new
  end

  def create
    binding.pry
    @huddle = current_user.huddles.build(huddle_params)

    if @huddle.save
      redirect_to huddles_path, notice: "Huddle Created"
    else
      render action: 'new'
    end
  end

private
  def huddle_params
    params.require(:huddle).permit( :skill_level, :size_of_huddle, :court, :user_id)
  end

end
