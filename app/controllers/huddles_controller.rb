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
      redirect_to huddles_path, notice: "Huddle Created"
    else
      render action: 'new'
    end
  end

  def update
    @huddle = Huddle.find(params[:id])
    @huddle.num_of_ballers_currently = (@huddle.num_of_ballers_currently + 1)
    @huddle.save

    render action: 'show'
  end

private
  def huddle_params
    params.require(:huddle).permit( :skill_level, :size_of_huddle, :court)
  end

end
