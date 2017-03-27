class GigsController < ApplicationController
before_action :set_gig, only: [:show, :edit, :update, :delete]

def index
  @gigs = Gig.all.order("created_at DESC").page(params[:page]).per(15)
end

def new
  @gig = Gig.new
end

def create
  @gig = current_user.gigs.new(gig_params)
  if @gig.save
    redirect_to @gig, notice: "Job created"
  else
    render :new
  end
end

def show

end

def search
  @gigs = Gig.search(params).page(params[:page]).per(25)
end

private

  def gig_params
    params.require(:gig).permit(:name, :description, :budget, :location, :open, :user_id, :category_id)
  end

  def set_gig
    @gig = Gig.find(params[:id])
  end
end